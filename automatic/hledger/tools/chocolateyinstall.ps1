$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.32.2/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '12fa9d70d6920584dac5072ab2d9038a2bc5d14b9bd445683dc3f750a84e3df0'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
