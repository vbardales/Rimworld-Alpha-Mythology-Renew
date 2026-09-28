# Crops the settings-window capture of the studio pass to the window itself (Virginie, 2026-09-28).
# The window is centred in a 1920x1080 capture: 900 x 700 at x 511, y 191 (measured on the pictures of pass 429e),
# with a margin around it. Writes <name>-cropped.png beside the source, the source is left as it is.
param([Parameter(Mandatory)][string]$Source, [int]$Margin = 24)
Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile((Resolve-Path $Source))
try {
    $x = 511 - $Margin; $y = 191 - $Margin; $w = 900 + 2 * $Margin; $h = 700 + 2 * $Margin
    $rect = New-Object System.Drawing.Rectangle $x, $y, $w, $h
    $bmp = ([System.Drawing.Bitmap]$img).Clone($rect, $img.PixelFormat)
    $out = [IO.Path]::ChangeExtension((Resolve-Path $Source).Path, $null).TrimEnd('.') + '-cropped.png'
    $bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output $out
} finally { $img.Dispose() }
