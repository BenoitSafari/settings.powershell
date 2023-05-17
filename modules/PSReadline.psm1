if (!(Get-Module -Name PSReadLine -ListAvailable)) {
    Write-Host "PSReadLine is not installed" -ForegroundColor Yellow
    Write-Host "Use the following command to install it => Install-Module PSReadLine -Force" -ForegroundColor Gray
}
else {
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
}
