$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/hyperspacedev/hyperspace/releases/download/v1.1.0/Hyperspace.Desktop.Setup.1.1.0.exe'
$packageName = 'Hyperspace'


$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'hyperspace*'
  checksum      = 'd2b41bb1675d3f7033b8a271c597717f14ca9574bf1bc2b726522546ca2069dd33dfff1623e27ff3c6c985c01866527725312b58afcad7c503b90bd865eb137c'
  checksumType  = 'sha512'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
