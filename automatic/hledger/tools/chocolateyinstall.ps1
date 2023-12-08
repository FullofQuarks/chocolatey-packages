$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.32.1/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '8734429c8137a83126be579af85118142df6d28ac6370472fc3baae684067d1c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
