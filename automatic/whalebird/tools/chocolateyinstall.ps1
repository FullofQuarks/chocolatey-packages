$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v6.0.0/Whalebird-6.0.0-win-x64.exe'
$checksum64  = 'c61420fb7849102bfd8d53d13f326ffa47bdda613a51d3d427ef049cd24b110f85f998b0f5f33965580dcd90d4f8fd9e49bbe889fb4acf00b6143c7cd00c6dfb'

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
