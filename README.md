## Installation
- Install [Powershell 7](https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/PowerShell-7.4.1-win-x64.msi)
- Install [oh-my-posh](https://ohmyposh.dev/)
- Create the following file 
   ```
   $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
   ```
- Insert the following line 
   ```
   Import-Module "$env:USERPROFILE\.powershell\Profile.ps1"
   ```
