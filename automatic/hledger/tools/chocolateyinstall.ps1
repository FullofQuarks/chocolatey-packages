$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.52.2/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '94ad023807407b28b70a3fa00f794a3abed5890b59d36b3baa46aa24d5085ebe'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
