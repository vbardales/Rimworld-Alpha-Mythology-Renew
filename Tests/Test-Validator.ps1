# Prove the validator rejects representative packaging/definition regressions.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$fixture = Join-Path ([IO.Path]::GetTempPath()) ('alpha-mythology-tests-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $fixture | Out-Null
try {
    Copy-Item "$root/Mod" $fixture -Recurse
    Copy-Item "$root/LICENSE", "$root/ATTRIBUTION.md" $fixture
    $validator = Join-Path $PSScriptRoot 'Check-Mod.ps1'
    & $validator -ModRoot $fixture
    $cases = @(
        @{ Name='wrong package ID'; File='Mod/About/About.xml'; From='nelim.alphamythologyrenew'; To='nelim.wrong'; Error='Wrong packageId' },
        @{ Name='missing race'; File='Mod/Defs/AlphaMythology/ThingDefs_Races/Races_Phoenix.xml'; From='<defName>MM_Phoenix</defName>'; To='<defName>MM_MissingPhoenix</defName>'; Error='Missing ThingDef MM_Phoenix' },
        @{ Name='dangling hatch target'; File='Mod/Defs/AlphaMythology/ThingDefs_Items/Items_Resource_MagicalAnimalEggs.xml'; From='<hatcherPawn>MM_Phoenix</hatcherPawn>'; To='<hatcherPawn>MM_MissingKind</hatcherPawn>'; Error='Missing PawnKindDef MM_MissingKind' },
        @{ Name='wrong death worker'; File='Mod/Defs/AlphaMythology/ThingDefs_Races/Races_Phoenix.xml'; From='AlphaMythologyRenew.DeathActionWorker_ExplodeAndSpawnEggs'; To='AlphaMythologyRenew.MissingWorker'; Error='Phoenix death worker disconnected' },
        @{ Name='flammable phoenix egg'; File='Mod/Defs/AlphaMythology/ThingDefs_Items/Items_Resource_MagicalAnimalEggs.xml'; From='<Flammability>0</Flammability>'; To='<Flammability>1</Flammability>'; Error='Phoenix egg must resist fire' },
        @{ Name='notice mismatch'; File='Mod/LICENSE'; From='No licence'; To='Some licence'; Error='LICENSE mismatch' }
    )
    foreach ($case in $cases) {
        $path = Join-Path $fixture $case.File
        $original = [IO.File]::ReadAllBytes($path)
        try {
            $text = Get-Content -LiteralPath $path -Raw
            if (-not $text.Contains($case.From)) { throw "Fixture target absent: $($case.Name)" }
            [IO.File]::WriteAllText($path, $text.Replace($case.From, $case.To))
            $failure = $null
            try { & $validator -ModRoot $fixture } catch { $failure = $_.Exception.Message }
            if ($failure -ne $case.Error) { throw "Case '$($case.Name)' expected '$($case.Error)', got '$failure'" }
            Write-Host "PASS negative case: $($case.Name)"
        } finally { [IO.File]::WriteAllBytes($path, $original) }
    }
} finally {
    # Delete only the unique fixture created above, directly under the system temp directory.
    $resolved = [IO.Path]::GetFullPath($fixture)
    $tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar)
    if ([IO.Path]::GetDirectoryName($resolved) -ne $tempRoot -or [IO.Path]::GetFileName($resolved) -notlike 'alpha-mythology-tests-*') { throw 'Unsafe fixture cleanup path' }
    Remove-Item -LiteralPath $resolved -Recurse -Force
}
