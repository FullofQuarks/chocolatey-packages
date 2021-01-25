$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v22.0.1/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v22.0.1/TheDesk-setup.exe'
$checksum   = '5c315cbb92937c9c7708904077bf6fd31ad8f0ebbc0223a301fe29bbcc3e2b030dcc85190a35392e719c1a4ecb1a7a98185c4c334c8724da390e6b1a1ea2f22c'
$checksum64 =  'ffaa617a6a26322b26ec3f0559d46b5180edad0423c0d3542e477fbde4b7b1e2a35879684f1f41366e161f34c868d2d17e838586094c20c7c12e2f115927282c'

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
