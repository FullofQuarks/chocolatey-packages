$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/hledgerorg/hledger/releases/download/1.99.4/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '2862b24d3fab686e01d13fa5dbc372ac04ba90414f4ce6eab558d24fdc5dcb5b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
