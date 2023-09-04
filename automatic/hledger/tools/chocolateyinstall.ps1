$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.31/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'b90f611a0e9d626b766c9982a2e36f37dff7abf64f76eaab3f5274cc0fd6b13f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
