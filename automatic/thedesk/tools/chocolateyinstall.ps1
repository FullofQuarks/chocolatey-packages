$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.1.3/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.1.3/TheDesk-setup.exe'
$checksum   = '5a8fcf7b9ea772365bb14d3b713aa033eb6b47d3c3b10c3682cd2d04f6e58cf3bc0d873484f04f7fdd32253c17f5755260efd5324065605b9bc14d41c8258bea'
$checksum64 =  '7a215c5840ef76b32cf73013cde71112350e587dce7c29ab1eda133581138576b8f485114dc84646d50a08e1b49778305e6d90196706ce75e7aa119af0dbd5bc'

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
