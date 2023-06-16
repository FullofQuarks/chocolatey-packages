$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.7/Whalebird-5.0.7-win-x64.exe'
$checksum64  = '339fc06f203f5acf754d5b618acd6a018ecf3f8258db60201e651963ef6db7c4f5e52441eafb9f07b6e4d8385863186ab5628e79acfae7c6eeaec9910af09ab9'

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
