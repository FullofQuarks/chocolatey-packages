$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.3.4/Whalebird-4.3.4-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.3.4/Whalebird-4.3.4-windows-x64.exe'
$checksum   = '1f9af16917bb29cd2c9460abed68d7918f9d6655cbf762f687588b1f1eb91d1208a810d8cec72dbf66b39850e16b41b3de099ef112e7da46e4aa09f80d2dbaa3'
$checksum64  = '94017590aa2120a2a6dd2a71ea8d64bae842bf2c8907174e529e6fe97e7d544c7cc3c6896ad99fd8f98a93845af2aab6f7e7a4dc5a27cffa640fe491f2b6d700'

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
