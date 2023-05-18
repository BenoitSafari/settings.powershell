# Launch Code Insiders
# Usage: codei path/to/project
if (!(Get-Command -Name code-insiders -ErrorAction SilentlyContinue)) {
    Write-Host "VSCode insiders is not installed `nDownload it at https://code.visualstudio.com/docs/?dv=win&build=insiders and make sure to add it to path" -ForegroundColor Yellow
}
else {
    Set-Alias -Name codei -Value code-insiders
}

