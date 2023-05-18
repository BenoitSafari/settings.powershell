# Execute Google Chrome with a specific port and protocol
# Usage: chromeDev -Port 8080 -Https $true

$ExePath = "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"

if (!(Get-Command -Name $ExePath -ErrorAction SilentlyContinue)) {
    Write-Host "Google Chrome is not installed `nDownload it at https://www.google.com/intl/en/chrome/" -ForegroundColor Yellow
}
else {
    function ExecChrome {
        param(
            [Parameter(Mandatory=$false)]
            [string]$Port = "8080",
            [bool]$Https = $false
        )

        $Protocol = if ($Https) { "https" } else { "http" }
        $Url = "{0}://localhost:{1}/" -f $Protocol, $Port

        $ChromeArgs = @(
            "--incognito",
            "--new-window",
            "$Url",
            "--user-data-dir=$env:USERPROFILE\Documents\data",
            "--no-default-browser-check",
            "--disable-popup-blocking",
            "--disable-sync",
            "--disable-translate",
            "--disable-web-security",
            "--lang=en_US"
        )

        Start-Process -FilePath $ExePath -ArgumentList $ChromeArgs -WindowStyle Hidden
    }

    Set-Alias -Name chromeDev -Value ExecChrome
}
