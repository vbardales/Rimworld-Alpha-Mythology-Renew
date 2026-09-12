[CmdletBinding()]
param([string]$ModRoot = (Split-Path $PSScriptRoot -Parent))
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ModRoot).Path
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
        Assert-Mod (-not $defs.ContainsKey($key)) "Duplicate $key in $($_.FullName)"
        $defs[$key] = $def
        if ($def.Name -eq 'PawnKindDef') { $kinds += $def }
    }
    foreach ($xpath in $xml.SelectNodes('//xpath')) {
        [void][System.Xml.XPath.XPathExpression]::Compile($xpath.InnerText)
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
$recipe = Require-Def 'RecipeDef' 'MM_ShutDownMechanoid'
Assert-Mod ($recipe.workerClass -ceq 'AlphaMythologyRenew.Recipe_ShutDown') 'Shutdown recipe worker disconnected'
[xml]$about = Get-Content "$root/Mod/About/About.xml" -Raw
$meta = $about.ModMetaData
Assert-Mod ($meta.name -ceq 'Alpha Mythology Renew (unofficial)') 'Wrong title'
Assert-Mod ($meta.packageId -ceq 'nelim.alphamythologyrenew') 'Wrong packageId'
Assert-Mod (@($meta.supportedVersions.li) -contains '1.6') 'RimWorld 1.6 support missing'
foreach ($dependency in @('brrainz.harmony', 'OskarPotocki.VanillaFactionsExpanded.Core')) {
    Assert-Mod (@($meta.modDependencies.li.packageId) -contains $dependency) "Missing dependency $dependency"
}
Assert-Mod (@($meta.incompatibleWith.li) -contains 'sarg.magicalmenagerie') 'Original mod incompatibility missing'
Assert-Mod ($meta.description.StartsWith('UNOFFICIAL.')) 'Disclosure missing'
Assert-Mod ($meta.description.Contains('[url=https://github.com/vbardales/Rimworld-Alpha-Mythology-Renew]Source code on GitHub[/url]')) 'Port GitHub link missing'
Assert-Mod (-not (Test-Path "$root/Mod/About/PublishedFileId.txt")) 'Review Workshop ID test when first publishing; upstream ID must not be copied'
foreach ($notice in @('ATTRIBUTION.md', 'LICENSE')) {
    Assert-Mod ((Get-FileHash "$root/$notice").Hash -eq (Get-FileHash "$root/Mod/$notice").Hash) "$notice mismatch"
}
foreach ($name in @('Preview.png', 'ModIcon.png')) {
    $path = "$root/Mod/About/$name"
    Assert-Mod (Test-Path $path) "Missing $name"
    $bytes = [IO.File]::ReadAllBytes($path)
    Assert-Mod ($bytes.Length -ge 24) "Truncated PNG $name"
    Assert-Mod ([Convert]::ToHexString($bytes[0..7]) -eq '89504E470D0A1A0A') "Invalid PNG signature $name"
    if ($name -eq 'Preview.png') { Assert-Mod ($bytes.Length -lt 1MB) 'Preview must be under 1 MiB' }
}
Assert-Mod (Test-Path "$root/Mod/Assemblies/AlphaMythologyRenew.dll") 'Shipped assembly missing'
$foreign = @(Get-ChildItem "$root/Mod/Assemblies" -Filter *.dll | Where-Object Name -ne 'AlphaMythologyRenew.dll')
Assert-Mod ($foreign.Count -eq 0) 'Unexpected bundled assembly'
Write-Host "PASS: $checks assertions; $($documents.Count) XML files; 25 creatures. Static contracts only; gameplay not executed."
