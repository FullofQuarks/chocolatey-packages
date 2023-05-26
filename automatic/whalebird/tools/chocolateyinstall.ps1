$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.5/Whalebird-5.0.5-win-x64.exe'
$checksum64  = '77a0f777a7ecbd8b24ec73fb212246a67daa35119f82f5dc86c2fa716e0d027f99beaac0b6bbb291883600544ec194bf161791381a012d081f742da74d5bc5d3'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64

  softwareName  = 'whalebird*'
  checksum64    = $checksum64
  checksumType64= 'sha512'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
