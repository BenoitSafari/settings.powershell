# THEME INITIALIZATION
Set-Item -Path Env:\POSH_THEME -Value $env:USERPROFILE\pwsh\themes\material.json
oh-my-posh init pwsh --config $env:POSH_THEME | Invoke-Expression

Import-Module $env:USERPROFILE\pwsh\modules\PSReadline.psm1
Import-Module $env:USERPROFILE\pwsh\modules\google_chrome.psm1
Import-Module $env:USERPROFILE\pwsh\modules\touch.psm1