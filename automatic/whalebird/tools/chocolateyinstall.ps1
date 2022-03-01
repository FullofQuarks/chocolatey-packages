$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.5.2/Whalebird-4.5.2-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.5.2/Whalebird-4.5.2-windows-x64.exe'
$checksum   = '8624a8432e5460dec4d69b858d60a7ee72a368bc0af7ef4cf203dcdeabe141b9d338aadafe400f625f8a41e87236ba3cbb0fa82d2c35debf36014eb8fe342f97'
$checksum64  = 'dcada30de5db8bfb36aa2728d90cfe039b29818aba1aaa5509268fcd8a71c6c2a4eb66425e6dd649e42e23670f38237a33fbb0ef8ec7ecdb64eaad086c45af9b'

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
