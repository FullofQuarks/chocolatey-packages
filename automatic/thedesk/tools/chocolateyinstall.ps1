$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.1.1/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.1.1/TheDesk-setup.exe'
$checksum   = 'c21b115bde5aad8c84c57f0be756e9d8031a9a81f3aaad246b82fc77450b90822b64c485873c3a9d62233fdb735d94fbc6c614add7b01f55570a01407f006e15'
$checksum64 =  'd7ebb3bcd5c2cbd02e2237973d6facb6fac24f6f8da09bee804c71b933e0ed17ca2d5d6e644cfca7c9221f7dcc7c31d37aa3401e6781d569edcc023001ae3c67'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/S"

  softwareName  = 'thedesk*'
  checksum      = $checksum
  checksumType  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
