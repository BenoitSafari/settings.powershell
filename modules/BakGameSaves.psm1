function BakGameSaves {
    $GamePaths = @(
        "$env:USERPROFILE\AppData\Local\Remedy\AlanWake2"
    )
    $Now = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

    $GamePaths | ForEach-Object {
        $GamePath = $_
        $GameSavePath = "$env:USERPROFILE\Downloads\GameSaves-$Now"

        if (-not (Test-Path -Path $GameSavePath)) {
            New-Item -Path $GameSavePath -ItemType Directory
        }

        Copy-Item -Path $GamePath -Destination $GameSavePath -Recurse -Force
    }
}