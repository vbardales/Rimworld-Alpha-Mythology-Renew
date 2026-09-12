"""Check audited text coverage against current Defs, patches and C# consumers.

Run with Python 3 (standard library only). DefInjection path/type reflection is
checked separately by the shared Check-DefInjected.ps1 against RimWorld and VEF.
"""
import argparse
from collections import Counter
import json
from pathlib import Path
import re
import shutil
import tempfile
import xml.etree.ElementTree as ET

FIELDS = set('label description labelPlural labelMale labelFemale customLabel '
             'jobString deathMessage labelNoun labelTendedWell labelTendedWellInner '
             'labelSolidTendedWell permanentLabel destroyedLabel destroyedOutLabel '
             'customString'.split())
KEY_FIELDS = set('buttonLabel buttonDesc buttonCancelLabel buttonCancelDesc '
                 'asexualHatchedMessage'.split())
KEY_LISTS = {'statToAdd', 'statValues', 'statDescriptions'}
UNCHANGED_NAMES = {'manticore', 'hydra', 'Alpha Mythology', 'ahuizotl', 'fenghuang',
                   'ieltxu', 'kappa', 'kitsune', 'qilin', 'tlilcoatl', 'xiezhi'}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def signature(text):
    return (Counter(re.findall(r'\{[^{}]+\}', text)),
            Counter(re.findall(r'</?[a-zA-Z][^>]*>', text)))


def resources(root, language, kind):
    result = {}
    for file in sorted((root / 'Mod').glob(f'**/Languages/{language}/{kind}/**/*.xml')):
        for node in ET.parse(file).getroot():
            key = (file.parent.name, node.tag) if kind == 'DefInjected' else node.tag
            require(key not in result, f'Duplicate {language} key: {key}')
            require(node.text and node.text.strip(), f'Empty {language} key: {key}')
            require('TODO' not in node.text and 'TODO' not in node.tag,
                    f'Unfinished translation: {key}')
            result[key] = node.text
    return result


def check(root):
    inventory = json.loads((root / 'Tests/TranslationInventory.json').read_text(encoding='utf-8'))
    expected = {(r['source'], r['type'], r['sourceKey']): r for r in inventory}
    require(len(expected) == len(inventory), 'Duplicate inventory entry')
    actual = {}
    # Consumed by VEF's CompExplodingHatcher for the salamander egg. The installed
    # VEF has English only, so this mod also supplies the French warning.
    used_keys = {'VEF_WarningEggExplodes', 'NocturnalAnimals.BodyClock',
                 'NocturnalAnimals.BodyClock_Description',
                 *(f'NocturnalAnimals.BodyClock_{clock}' for clock in ('Diurnal', 'Nocturnal', 'Crepuscular'))}

    def walk(node, path, typ, source):
        if node.tag in FIELDS and node.text and node.text.strip():
            actual[(source, typ, path)] = node.text
        if node.tag in KEY_FIELDS and node.text:
            used_keys.add(node.text)
        if node.tag in KEY_LISTS:
            used_keys.update(c.text for c in node)
        for i, child in enumerate(node):
            walk(child, path + '.' + (str(i) if child.tag == 'li' else child.tag), typ, source)

    for file in sorted((root / 'Mod').glob('**/*.xml')):
        if not {'Defs', 'Patches'} & set(file.parts):
            continue
        for definition in ET.parse(file).getroot().iter():
            name = definition.findtext('defName')
            if name:
                walk(definition, name, definition.tag, file.relative_to(root).as_posix())
        for ext in ET.parse(file).findall('.//li[@Class="VEF.AnimalBehaviours.AnimalStatExtension"]'):
            columns = [ext.find(tag) for tag in ('statToAdd', 'statValues', 'statDescriptions')]
            require(len({len(n) for n in columns}) == 1, f'Misaligned stat columns: {file}')
            require(all(not n.text.endswith('Desc') for n in columns[1]),
                    f'Description used as short role: {file}')

    require(actual.keys() == expected.keys(),
            f'Inventory drift: added={actual.keys()-expected.keys()}, removed={expected.keys()-actual.keys()}')
    fr = resources(root, 'French', 'DefInjected')
    required_paths = set()
    for identity, row in expected.items():
        require(actual[identity] == row['en'], f'English source changed; review translation: {identity}')
        if 'mechanism' in row:
            require(row['sourceKey'] == 'MM_WillOWisp.comps.0.customString', 'Unknown text exemption')
            continue
        key = (row['type'], row['key'])
        required_paths.add(key)
        require(key in fr, f'Missing French injection: {key}')
        require(signature(row['en']) == signature(fr[key]), f'Formatting mismatch: {key}')
        require(fr[key] != row['en'] or fr[key] in UNCHANGED_NAMES, f'English fallback: {key}')
    require(required_paths == fr.keys(), f'Stale French injections: {fr.keys()-required_paths}')

    for file in (root / 'Source').glob('*.cs'):
        used_keys.update(re.findall(r'"((?:AMR_|MM_)[^"]+)"\.Translate\(', file.read_text(encoding='utf-8')))
    en_keys = resources(root, 'English', 'Keyed')
    fr_keys = resources(root, 'French', 'Keyed')
    require(used_keys == en_keys.keys() == fr_keys.keys(),
            f'Keyed coverage: missing EN={used_keys-en_keys.keys()}, missing FR={used_keys-fr_keys.keys()}, '
            f'unused EN={en_keys.keys()-used_keys}, unused FR={fr_keys.keys()-used_keys}')
    for key in used_keys:
        require(signature(en_keys[key]) == signature(fr_keys[key]), f'Parameter mismatch: {key}')
        require(en_keys[key] != fr_keys[key], f'Untranslated Keyed text: {key}')
    folders = ET.parse(root / 'Mod/LoadFolders.xml').getroot().find('v1.6')
    require(folders.findtext('li') == '/', 'Main mod load folder missing')
    require(any(n.text == 'Integrations/Achievements' and
                n.get('IfModActive') == 'vanillaexpanded.achievements' for n in folders),
            'Achievement translations must be conditional')
    print(f'PASS: {len(inventory)} audited fields, {len(fr)} French injections, '
          f'{len(used_keys)} English/French Keyed pairs; runtime not tested.')


def negative_cases(root):
    mutations = ('missing_key', 'missing_injection', 'bad_parameter', 'new_text')
    for mutation in mutations:
        with tempfile.TemporaryDirectory(prefix='amr-translations-') as temp:
            copy = Path(temp)
            for folder, pattern in [('Mod', '*.xml'), ('Source', '*.cs'), ('Tests', 'TranslationInventory.json')]:
                for source in (root / folder).rglob(pattern):
                    target = copy / source.relative_to(root)
                    target.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copy2(source, target)
            if mutation == 'new_text':
                file = copy / 'Mod/Defs/TranslationProbe.xml'
                file.write_text('<Defs><ThingDef><defName>Probe</defName><label>New text</label></ThingDef></Defs>')
            else:
                file = copy / ('Mod/Languages/French/DefInjected/ThingDef/AlphaMythology.xml'
                               if mutation == 'missing_injection' else 'Mod/Languages/French/Keyed/AlphaMythology.xml')
                tree = ET.parse(file)
                node = tree.getroot()
                if mutation == 'bad_parameter':
                    node.find('AMR_AsexualReproductionProgress').text = 'Progression : {8}'
                else:
                    node.remove(node[0])
                tree.write(file, encoding='utf-8', xml_declaration=True)
            try:
                check(copy)
            except ValueError:
                print(f'PASS negative case: {mutation}')
            else:
                raise ValueError(f'Validator accepted {mutation}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--self-test', action='store_true')
    args = parser.parse_args()
    check(args.root)
    if args.self_test:
        negative_cases(args.root)
