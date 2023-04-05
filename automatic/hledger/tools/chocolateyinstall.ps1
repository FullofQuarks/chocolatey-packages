$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/hledger-web-1.29.1/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '4ff9d88e2fbdb4f4805c9da5e5fa8005429fa01f63abd78218b57ec915f58030'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
