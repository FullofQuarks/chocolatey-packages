$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.29.2/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'e47dc6536c41acd09e724e5591197ac320a4d529c029d9c54bfba38ae12529af'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
