$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.99.3/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '2c06d7abde6de04792dd48409c8d36eb2d5d6314a9e13d090eb99de47f06c6fb'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
