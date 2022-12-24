$exePath = "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"

if (!(Get-Command -Name $exePath -ErrorAction SilentlyContinue)) {
  Write-Host "Google Chrome is not installed" -ForegroundColor Yellow
}
else {
  Function ExecChrome {
    $chrome = $exePath
    $chromeArgs = @(
      "--user-data-dir=$env:USERPROFILE\Documents\data"
      "--no-default-browser-check"
      "--disable-popup-blocking"
      "--disable-sync"
      "--disable-translate"
      "--disable-web-security"
    )
  
    Start-Process -FilePath $chrome -ArgumentList $chromeArgs -WindowStyle Hidden
  }
  
  Set-Alias -Name chromeDev -Value ExecChrome
}
