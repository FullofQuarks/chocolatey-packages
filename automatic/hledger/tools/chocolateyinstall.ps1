$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.22.2/hledger-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'd7ed8b4ac563e6f9d6badbd1eb9d9cf2da873d6685628710c1cd8c472d42edaf'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs