param([Parameter(Mandatory)][string]$ModRoot, [string]$SharedDir)

# Own values and facts of this port's content: the 25 creatures, the phoenix death worker and fire-resistant egg, the bleeding
# wound, the settings contract (Source/Settings.cs, Source/SpawnRules.cs, hidden AMR_Settings shortcut), the About identity,
# dependencies and incompatibility, the Steam description contract and the single shipped DLL. One consumer, nothing shareable;
# Tests/Test-Mod.ps1 (generated) runs it after the shared checks. Prints findings, exit 1 on any.
# The generic checks live in the shared scripts: Check-ModBasics (XML, defNames, About shape and "(unofficial)", images),
# Check-DefRefs (race, hatch and egg references), Check-Textures, Check-PatchTargets, Check-ConfigErrors. The translation coverage
# (Check-Translations) is run here only for the compatibility Keyed entries kept on purpose, which it must be told about.
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ModRoot).Path
$mod = Join-Path $root 'Mod'
$script:findings = @()

# One rule: the block returns its problems; each is printed under the rule name.
function It([string]$name, [scriptblock]$body) {
    try { $problems = @(& $body | Where-Object { $_ }) } catch { $problems = @("threw: $($_.Exception.GetBaseException().Message)") }
    foreach ($p in $problems) { $script:findings += "[$name] $p" }
}
function Read-Text([string]$p) { Get-Content -LiteralPath $p -Raw -Encoding UTF8 }
function Def([string]$type, [string]$name) {
    $node = $script:index["${type}:$name"]
    if ($null -eq $node) { throw "Missing $type $name" }
    return $node
}

$script:index = @{}
$script:kinds = @()
$script:fileCount = 0
It 'Definitions are indexed, 25 creatures, no Animal Ark namespace left' {
    foreach ($file in Get-ChildItem -LiteralPath $mod -Recurse -File -Filter *.xml) {
        $script:fileCount++
        [xml]$doc = Read-Text $file.FullName
        foreach ($node in $doc.SelectNodes('/Defs/*[defName]')) {
            $script:index["$($node.Name):$($node.defName)"] = $node
            if ($node.Name -eq 'PawnKindDef') { $script:kinds += $node }
        }
        if ($doc.OuterXml -match 'Bastyon\.') { "Old Animal Ark namespace in $($file.FullName)" }
    }
    if ($script:kinds.Count -ne 25) { "Expected 25 creatures, got $($script:kinds.Count)" }
}
It 'Hatch durations are positive' {
    foreach ($node in $script:index.Values) {
        foreach ($hatcher in $node.SelectNodes('comps/li[hatcherPawn]')) {
            $days = [double]::Parse($hatcher.hatcherDaystoHatch, [cultureinfo]::InvariantCulture)
            if ($days -le 0) { "Invalid hatch duration for $($hatcher.hatcherPawn)" }
        }
    }
}
It 'Phoenix, its egg and the bleeding wound stay connected' {
    $phoenix = Def 'ThingDef' 'MM_Phoenix'
    if ($phoenix.race.deathAction.workerClass -cne 'AlphaMythologyRenew.DeathActionWorker_ExplodeAndSpawnEggs') { 'Phoenix death worker disconnected' }
    $egg = Def 'ThingDef' 'MM_EggPhoenixFertilized'
    if ($egg.statBases.Flammability -ne '0') { 'Phoenix egg must resist fire' }
    if ($egg.SelectSingleNode("comps/li[@Class='CompProperties_Hatcher']/hatcherPawn").InnerText -cne 'MM_Phoenix') { 'Phoenix egg hatches the wrong creature' }
    if ((Def 'HediffDef' 'MM_BleedingWound').hediffClass -cne 'AlphaMythologyRenew.Hediff_BleedingWound') { 'Bleeding wound worker disconnected' }
    $null = Def 'DamageDef' 'MM_UncontrollableBleeding'
}
It 'Settings shortcut is hidden by default and the settings contract holds' {
    $button = Def 'MainButtonDef' 'AMR_Settings'
    if ($button.workerClass -cne 'AlphaMythologyRenew.MainButtonWorker_AlphaMythologySettings') { 'Settings shortcut worker disconnected' }
    if ($button.buttonVisible -cne 'false') { 'Settings shortcut must be hidden by default (buttonVisible false)' }
    $rules = Read-Text (Join-Path $root 'Source/SpawnRules.cs')
    foreach ($needle in 'DefaultMultiplier = 1f', 'MinMultiplier = 0.1f', 'MaxMultiplier = 5f') {
        if (-not $rules.Contains($needle)) { "Settings contract: '$needle' missing from Source/SpawnRules.cs" }
    }
    $settings = Read-Text (Join-Path $root 'Source/Settings.cs')
    foreach ($needle in ': ModSettings', ': Mod', 'SettingsCategory', 'MainButtonWorker', 'Dialog_ModSettings', 'CommonalityOfAnimal', 'SpawnRules.Sanitize',
            'Scribe_Values.Look(ref spawnMultiplier', 'Scribe_Collections.Look(ref blocked') {
        if (-not $settings.Contains($needle)) { "Settings contract: '$needle' missing from Source/Settings.cs" }
    }
}
It 'About identity, dependencies, incompatibility and Steam description contract' {
    [xml]$about = Read-Text (Join-Path $mod 'About/About.xml')
    $meta = $about.ModMetaData
    if ($meta.name -cne 'Alpha Mythology Renew (unofficial)') { 'Wrong title' }
    if ($meta.packageId -cne 'nelim.alphamythology') { 'Wrong packageId' }
    if (@($meta.supportedVersions.li) -notcontains '1.6') { 'RimWorld 1.6 support missing' }
    foreach ($dependency in 'brrainz.harmony', 'OskarPotocki.VanillaFactionsExpanded.Core', 'nelim.resolvethisinstead') {
        if (@($meta.modDependencies.li.packageId) -notcontains $dependency) { "Missing dependency $dependency" }
    }
    if (@($meta.incompatibleWith.li) -notcontains 'sarg.magicalmenagerie') { 'Original mod incompatibility missing' }
    if (-not $meta.description.StartsWith('UNOFFICIAL.')) { 'Disclosure missing' }
    # The description is generated from the Markdown block of PUBLICATION.md (plain text, links as 'label (url)'): the source link ends it, after the credits.
    $link = 'https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew'
    if (-not $meta.description.TrimEnd().EndsWith("Source code on GitHub ($link)")) { 'Port GitHub link missing or not last in About.xml' }
    $publication = (Read-Text (Join-Path $root 'PUBLICATION.md')) -replace "`r`n", "`n"
    $fence = '`' * 3
    if (-not $publication.Contains("## Steam description`n")) { 'PUBLICATION.md has no "## Steam description" section' }
    if (-not $publication.Contains("[Source code on GitHub]($link)`n$fence")) { 'PUBLICATION.md Steam description must end with the source link, right before the closing fence' }
    $idFile = Join-Path $mod 'About/PublishedFileId.txt'
    if ((Test-Path -LiteralPath $idFile) -and (Read-Text $idFile).Trim() -eq '1821617793') { 'PublishedFileId.txt holds the ORIGINAL mod id' }
}
It 'Exactly one assembly ships: AlphaMythologyRenew.dll' {
    $dlls = @(Get-ChildItem -LiteralPath (Join-Path $mod 'Assemblies') -Filter *.dll -File | ForEach-Object Name)
    if ($dlls.Count -ne 1 -or $dlls[0] -cne 'AlphaMythologyRenew.dll') { "Shipped assemblies: $($dlls -join ', ')" }
}
It 'Translation coverage with the compatibility Keyed entries kept on purpose' {
    # Kept without a call in Source/: Nocturnal Animals reads the BodyClock keys, VEF reads VEF_WarningEggExplodes (Mod/Languages/English/Keyed/VEF.xml).
    $translations = if ($SharedDir) { Join-Path $SharedDir 'Check-Translations.ps1' }
    if (-not $translations -or -not (Test-Path -LiteralPath $translations)) { return }
    $kept = 'NocturnalAnimals.BodyClock', 'NocturnalAnimals.BodyClock_Diurnal', 'NocturnalAnimals.BodyClock_Crepuscular', 'NocturnalAnimals.BodyClock_Nocturnal', 'NocturnalAnimals.BodyClock_Description', 'VEF_WarningEggExplodes'
    # -File would hand the array over as one string: the keys go through -Command.
    $keys = ($kept | ForEach-Object { "'$_'" }) -join ','
    $out = @(& powershell -NoProfile -ExecutionPolicy Bypass -Command "& '$translations' -ModRoot '$root' -AllowUnused $keys; exit `$LASTEXITCODE" 2>&1 | ForEach-Object { "$_" })
    if ($LASTEXITCODE -ne 0) { $out | Where-Object { $_ -match '\S' } | Select-Object -Last 15 }
}

if ($script:findings.Count) { $script:findings; exit 1 }
Write-Output "PASS: Rule-OwnValues ($($script:fileCount) XML files, $($script:kinds.Count) creatures)"
