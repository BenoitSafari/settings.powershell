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
    
    $files = Get-ChildItem -Path . -Filter "*.$Extension"
    if ($files.Count -eq 0) {
      return Write-Host "No files found with extension '$Extension'" -ForegroundColor Yellow
    }
    $files | ForEach-Object {
      $name = $_.BaseName
      $7zArgs = @(
        "a"
        "-t7z"
        "-mx=9"
        "-m0=lzma2"
        "-mmt=on"
        "-ms=on"
        "$name.7z"
        "$name.$Extension"
      )
      Start-Process -FilePath $exePath -ArgumentList $7zArgs -Wait
      # Check if the file was created
      if (!(Test-Path "$name.7z")) {
        return Write-Host "$name.$Extension compression failed" -ForegroundColor Red
      }
      else {
        Remove-Item -Path "$name.$Extension"
        return Write-Host "$name.7z - Created" -ForegroundColor Green
      }
    }
  }
}
