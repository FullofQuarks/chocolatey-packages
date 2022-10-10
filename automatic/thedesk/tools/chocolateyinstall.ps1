$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v23.0.1/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v23.0.1/TheDesk-setup.exe'
$checksum   = '60127c2973d5c0a5964a90e4effb0cdd57c84e63d7f587172791938ee284a2fd62859b854812c1618b3c36df26a8d2f237703733f997fcea123c7a3ca16b7940'
$checksum64 =  'c726ac6044e8aef3636f9b3c78e2885026c8305d853c5aa1d3f380bb5fc0fd9e9636fb78170ac74f190af2561ba89e2f80b05dbb6ce5f7b5a7a3f0f04db8399d'

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
