$env:PWSH_PATH = "$env:USERPROFILE\.powershell"

# Items initialization
Set-Item -Path Env:\POSH_THEME -Value "$env:PWSH_PATH\themes\material.json"
oh-my-posh init pwsh --config $env:POSH_THEME | Invoke-Expression

# PSReadLine initialization
if (!(Get-Module -Name PSReadLine -ListAvailable)) {
    Install-Module PSReadLine -Force -SkipPublisherCheck -AcceptLicense
}
else {
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
}

Import-Module "$env:PWSH_PATH\modules\BakGameSaves.psm1"