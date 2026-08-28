$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/plaintextaccounting/hledger/releases/download/1.52.3/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'ae16e1f6a311f7cae6e09d4ef1d0fc0c214fb4041d9100d0ac29bade1219fc09'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
