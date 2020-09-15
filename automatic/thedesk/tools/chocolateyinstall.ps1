$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.2.2/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.2.2/TheDesk-setup.exe'
$checksum   = 'f1854cdca4aa9b8bc8d2a9a537a2ed6add8b3ab6078c6c6494ce6ba4139df2df0c851344713cb7e0aa6c8901844bc7531c67965315afbf751c4f6ccb8adb4efe'
$checksum64 =  '722dd3088d9ed486f56e291597054abf7efe2459f4a5ecd8b04a65a9ee59ed1aec924a0b3a286ad97d1bef4980e50735f2b7b0fe492dcc770f02b8ee460833c2'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/S"

  softwareName  = 'thedesk*'
  checksum      = $checksum
  checksumType  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
