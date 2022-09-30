$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.25/hledger-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '19838b6e732ed10ee88b64aa806247a5c7b7c5d3266d804288972ce588e2e426'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
