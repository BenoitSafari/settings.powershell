if (!(Get-Command -Name "C:\Program Files\Google\Chrome\Application\chrome.exe" -ErrorAction SilentlyContinue)) {
  Write-Host "Google Chrome is not installed" -ForegroundColor Yellow
}
else {
  Function ExecChrome {
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
  
  Set-Alias -Name chromeDev -Value ExecChrome
}
