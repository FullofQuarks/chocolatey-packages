$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.32/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7beb0baa47f8e44b62a2420a3d34121620edd5b8dfcdb7049422a3ca38c09053'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
