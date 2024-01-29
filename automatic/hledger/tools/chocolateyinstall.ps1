$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.32.3/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '5dc1e960c939de22ad417312828369bedd405308288fc5be6df7d043fa61e81b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
