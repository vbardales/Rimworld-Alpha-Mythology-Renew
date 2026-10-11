# What only this mod knows: the 25 creatures and their links, the phoenix and bleeding-wound workers, the settings contract,
# the About dependencies and the Steam description contract. The generic checks (XML well formed, no duplicate defName,
# XPath compiles, About shape and "(unofficial)", ATTRIBUTION/LICENSE, images, PublishedFileId) live in the shared
# scripts/Check-ModBasics.ps1, called first.
[CmdletBinding()]
param([string]$ModRoot = (Split-Path $PSScriptRoot -Parent))
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ModRoot).Path
$shared = Join-Path $PSScriptRoot '../../scripts/Check-ModBasics.ps1'
if (Test-Path $shared) {
    & pwsh -NoProfile -File $shared -ModRoot $root -Unofficial -OriginalWorkshopId 1821617793
    if ($LASTEXITCODE -ne 0) { throw 'Check-ModBasics reported findings' }
} else {
    Write-Warning 'scripts/Check-ModBasics.ps1 not found beside this repository (standalone checkout, CI): the generic checks did NOT run.'
}
$defs = @{}; $kinds = @(); $documents = @(); $checks = 0
function Assert-Mod([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:checks++
}
function Require-Def([string]$Type, [string]$Name) {
    Assert-Mod ($defs.ContainsKey("${Type}:$Name")) "Missing $Type $Name"
    return $defs["${Type}:$Name"]
}
Get-ChildItem "$root/Mod" -Recurse -File -Filter *.xml | ForEach-Object {
    [xml]$xml = Get-Content -LiteralPath $_.FullName -Raw
    $documents += $xml
    foreach ($def in $xml.SelectNodes('/Defs/*[defName]')) {
        $key = $def.Name + ':' + $def.defName
        $defs[$key] = $def
        if ($def.Name -eq 'PawnKindDef') { $kinds += $def }
    }
    Assert-Mod ($xml.OuterXml -notmatch 'Bastyon\.') "Old Animal Ark namespace in $($_.FullName)"
}
Assert-Mod ($kinds.Count -eq 25) "Expected 25 creatures, got $($kinds.Count)"
foreach ($kind in $kinds) { $null = Require-Def 'ThingDef' $kind.race }
foreach ($doc in $documents) {
    foreach ($hatcher in $doc.SelectNodes('/Defs/ThingDef/comps/li[hatcherPawn]')) {
        $null = Require-Def 'PawnKindDef' $hatcher.hatcherPawn
        $days = [double]::Parse($hatcher.hatcherDaystoHatch, [cultureinfo]::InvariantCulture)
        Assert-Mod ($days -gt 0) "Invalid hatch duration for $($hatcher.hatcherPawn)"
    }
    foreach ($egg in $doc.SelectNodes('/Defs/ThingDef/comps/li/eggFertilizedDef | /Defs/ThingDef/comps/li/eggUnfertilizedDef')) {
        $null = Require-Def 'ThingDef' $egg.InnerText
    }
}
$phoenix = Require-Def 'ThingDef' 'MM_Phoenix'
Assert-Mod ($phoenix.race.deathAction.workerClass -ceq 'AlphaMythologyRenew.DeathActionWorker_ExplodeAndSpawnEggs') 'Phoenix death worker disconnected'
$egg = Require-Def 'ThingDef' 'MM_EggPhoenixFertilized'
Assert-Mod ($egg.statBases.Flammability -eq '0') 'Phoenix egg must resist fire'
Assert-Mod ($egg.SelectSingleNode("comps/li[@Class='CompProperties_Hatcher']/hatcherPawn").InnerText -ceq 'MM_Phoenix') 'Phoenix egg hatches the wrong creature'
$wound = Require-Def 'HediffDef' 'MM_BleedingWound'
Assert-Mod ($wound.hediffClass -ceq 'AlphaMythologyRenew.Hediff_BleedingWound') 'Bleeding wound worker disconnected'
$null = Require-Def 'DamageDef' 'MM_UncontrollableBleeding'
$button = Require-Def 'MainButtonDef' 'AMR_Settings'
Assert-Mod ($button.workerClass -ceq 'AlphaMythologyRenew.MainButtonWorker_AlphaMythologySettings') 'Settings shortcut worker disconnected'
Assert-Mod ($button.buttonVisible -ceq 'false') 'Settings shortcut must be hidden by default (buttonVisible false)'
$settingsSource = Get-Content "$root/Source/Settings.cs" -Raw
$rulesSource = Get-Content "$root/Source/SpawnRules.cs" -Raw
foreach ($needle in @('DefaultMultiplier = 1f', 'MinMultiplier = 0.1f', 'MaxMultiplier = 5f')) {
    Assert-Mod ($rulesSource.Contains($needle)) "Settings contract: '$needle' missing from Source/SpawnRules.cs"
}
foreach ($needle in @(': ModSettings', ': Mod', 'SettingsCategory', 'MainButtonWorker', 'Dialog_ModSettings',
        'CommonalityOfAnimal', 'SpawnRules.Sanitize',
        'Scribe_Values.Look(ref spawnMultiplier', 'Scribe_Collections.Look(ref blocked')) {
    Assert-Mod ($settingsSource.Contains($needle)) "Settings contract: '$needle' missing from Source/Settings.cs"
}
[xml]$about = Get-Content "$root/Mod/About/About.xml" -Raw
$meta = $about.ModMetaData
Assert-Mod ($meta.name -ceq 'Alpha Mythology Renew (unofficial)') 'Wrong title'
Assert-Mod ($meta.packageId -ceq 'nelim.alphamythology') 'Wrong packageId'
Assert-Mod (@($meta.supportedVersions.li) -contains '1.6') 'RimWorld 1.6 support missing'
foreach ($dependency in @('brrainz.harmony', 'OskarPotocki.VanillaFactionsExpanded.Core', 'nelim.resolvethisinstead')) {
    Assert-Mod (@($meta.modDependencies.li.packageId) -contains $dependency) "Missing dependency $dependency"
}
Assert-Mod (@($meta.incompatibleWith.li) -contains 'sarg.magicalmenagerie') 'Original mod incompatibility missing'
Assert-Mod ($meta.description.StartsWith('UNOFFICIAL.')) 'Disclosure missing'
# The description is generated from the Markdown block of PUBLICATION.md (plain text, links as 'label (url)'): the source link ends it, after the credits.
Assert-Mod ($meta.description.TrimEnd().EndsWith('Source code on GitHub (https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew)')) 'Port GitHub link missing or not last in About.xml'
$publication = (Get-Content "$root/PUBLICATION.md" -Raw) -replace "`r`n", "`n"
$fence = '`' * 3
Assert-Mod ($publication.Contains("## Steam description`n")) 'PUBLICATION.md has no "## Steam description" section'
Assert-Mod ($publication.Contains("[Source code on GitHub](https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew)`n$fence")) 'PUBLICATION.md Steam description must end with the source link, right before the closing fence'
Assert-Mod (Test-Path "$root/Mod/Assemblies/AlphaMythologyRenew.dll") 'Shipped assembly missing'
$foreign = @(Get-ChildItem "$root/Mod/Assemblies" -Filter *.dll | Where-Object Name -ne 'AlphaMythologyRenew.dll')
Assert-Mod ($foreign.Count -eq 0) 'Unexpected bundled assembly'
Write-Host "PASS: $checks assertions; $($documents.Count) XML files; 25 creatures. Static contracts only; gameplay not executed."
