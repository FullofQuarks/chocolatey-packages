$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.3.0/Whalebird-4.3.0-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.3.0/Whalebird-4.3.0-windows-x64.exe'
$checksum   = 'ce0db09802402ea464ba63042f2a910cc61c09098b719edf5e661420bbe499e328b98a0c992a0aa0f48b586314f5979402349a536a40e71550f4bca46e4cc7e9'
$checksum64  = '94f1bd54a0cac33052fda0ae0dd7504d4fc508cbd119641ece49760e9c31a89fda20adb6320f28bfd3c00329962b8d491b55a0138f5e16fb8be08506a5e02410'

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
