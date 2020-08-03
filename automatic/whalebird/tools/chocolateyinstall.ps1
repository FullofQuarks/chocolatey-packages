$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.0/Whalebird-4.2.0-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.0/Whalebird-4.2.0-windows-x64.exe'
$checksum   = '4f5bb22b9fcb666d7cf6d3c6c75b4bd125e1e2eed6bb545ee45d681d35fab910de21daa4755ed10567381ba49fbcb1d8b34897887b7bffe6cd75891eb086120f'
$checksum64  = 'da7aceca1b9dff9c1cae748a747fb90f84f7c16cafe4392749c3eb8a842a76b5604cf30e6a85ac07e796ec8ab062d83d252c0f3732ca31c5b84d2409557af8fd'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'whalebird*'
  checksum      = $checksum
  checksumType32  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
