$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.30/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '2f31de09e050912abf019bc8ba32f5c01f06d259adbc4cd21e7a916ac6f288d1'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
