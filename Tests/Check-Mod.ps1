$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$defs=@{}; $kinds=@(); $count=0
Get-ChildItem "$root/Mod" -Recurse -File -Filter *.xml | ForEach-Object {
 [xml]$x=Get-Content $_.FullName -Raw; $count++
 foreach($d in $x.SelectNodes('/Defs/*[defName]')) { $key=$d.Name+':'+$d.defName; if($defs.ContainsKey($key)){throw "Duplicate $key"}; $defs[$key]=$d; if($d.Name -eq 'PawnKindDef'){$kinds+= $d} }
 foreach($xp in $x.SelectNodes('//xpath')){[void][System.Xml.XPath.XPathExpression]::Compile($xp.InnerText)}
 if($x.OuterXml -match 'Bastyon\.') {throw 'Old Animal Ark namespace remains'}
}
if($kinds.Count -ne 25){throw "Expected 25 creatures, got $($kinds.Count)"}
foreach($kind in $kinds){if(-not $defs.ContainsKey('ThingDef:'+$kind.race)){throw "Missing race $($kind.race)"}}
[xml]$about=Get-Content "$root/Mod/About/About.xml" -Raw
if($about.ModMetaData.name -ne 'Alpha Mythology Renew (unofficial)'){throw 'Wrong title'}
if(-not $about.ModMetaData.description.StartsWith('UNOFFICIAL.')){throw 'Disclosure missing'}
if(Test-Path "$root/Mod/About/PublishedFileId.txt"){throw 'Upstream Workshop ID must not be copied'}
if((Get-FileHash "$root/ATTRIBUTION.md").Hash -ne (Get-FileHash "$root/Mod/ATTRIBUTION.md").Hash){throw 'Attribution mismatch'}
Write-Host "$count XML files, 25 races, unique defs, XPath syntax, namespace and metadata: PASS"
