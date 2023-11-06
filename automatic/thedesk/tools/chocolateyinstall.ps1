$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.1.6/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.1.6/TheDesk-setup.exe'
$checksum   = 'c63ce4aeaa7f53248a000f6088e71b2618ee68076312f319a9e0564a0b9a5d15e08a0e6766404f279de215cc8207a8721ebbd973ba09fe7709a56432d1e559c0'
$checksum64 =  '5cbe126468c91525f0f3fb488a303b0709777fdd9e046236bc09ce14bd66cac574907b26ef2c74b1328cf1f7a8199dd877bb69deaed06e7d30ec1497b11dea30'

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
