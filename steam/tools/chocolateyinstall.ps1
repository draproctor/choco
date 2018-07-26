$url = 'https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe'
$silentArgs = '/S'
$requestor = [System.Web.WebRequest]::Create($url)

if ($requestor.GetResponse().StatusCode -ne 'OK') {
  Write-Output "$url is unreachable. Installation failed."
  exit 1603
}

$installChocoPkg = @{
  PackgeName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = $silentArgs
  Url = $url
  ValidExitCodes = 0
}

Install-ChocolateyPackage @installChocoPkg
