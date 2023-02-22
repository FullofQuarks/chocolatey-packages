$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.28/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'f04afa61e736de18cb7418913662b8b7b7d298b4c67ae96b0ed2538f34aa8005'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
