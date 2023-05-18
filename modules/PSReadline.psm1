if (!(Get-Module -Name PSReadLine -ListAvailable)) {
    Write-Host "PSReadLine is not installed `nUse the following command to install it => Install-Module PSReadLine -Force" -ForegroundColor Yellow
}
else {
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
}
