$exePath = "$env:ProgramFiles\7-Zip\7z.exe"

if (!(Get-Command -Name $exePath -ErrorAction SilentlyContinue)) {
    Write-Host "7-Zip is not installed" -ForegroundColor Yellow
}
else {
    Function CompressAll {
        [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$Extension
        )
        
        $files = Get-ChildItem -Name -Filter "*.$Extension"
        
        if ($files.Count -eq 0) {
            return Write-Host "No files found with extension '$Extension'" -ForegroundColor Yellow
        }
        
        foreach ($f in $files) {
            $filename7z = "$f.7z"
            Start-Process -FilePath $exePath -ArgumentList "a -t7z -mx=9 -m0=lzma2 -mmt=on -ms=on -sdel `"$filename7z`" `"$f`"" -Wait
            if (!(Test-Path "$filename7z")) {
                Write-Host "$f compression failed" -ForegroundColor Red
            }
            else {
                Write-Host "$filename7z - Created" -ForegroundColor Green
            }
        }
    }
}
