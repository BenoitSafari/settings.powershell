oh-my-posh init pwsh --config 'C:\Users\grego\.posh\themes\material.json' | Invoke-Expression

# Ensure that PSReadLine is installed => Install-Module PSReadLine -Force
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Function ExecChrome
{
    $chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    $chromeArgs = @(
        "--user-data-dir=C:\Users\grego\Documents\data"
        "--no-default-browser-check"
        "--disable-popup-blocking"
        "--disable-sync"
        "--disable-translate"
        "--disable-web-security"
    )

    Start-Process -FilePath $chrome -ArgumentList $chromeArgs -WindowStyle Hidden
}

Function touch
{
    Param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$path
    )
    New-Item -Path $path -ItemType File -Force
}
        
Set-Alias -Name chromeDev -Value ExecChrome
