$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.24/hledger-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'ef31de7a3b5ecb67e71c49089f571e7c3206c75ea77124cf659bcb0ec603ed62'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
