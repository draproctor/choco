# Stop any potential Steam services, though there shouldn't be any.
# If the processes get stuck, stop this install.
$ErrorActionPreference = 'Stop'

$processNames = @(
  'Steam'
  'SteamService'
  'steamwebhelper'
  'GameOverlayUI'
)

$steamService = 'Steam Client Service'

$processNames | Stop-Process -Force
Stop-Service -Name $steamService -Force
Set-Service -Name $steamService -StartupType Disabled
