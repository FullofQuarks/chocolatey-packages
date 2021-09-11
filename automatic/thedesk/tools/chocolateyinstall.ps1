$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v22.3.1/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v22.3.1/TheDesk-setup.exe'
$checksum   = 'aba0ab14bc9908fe88d15dc9a4b2181c5343f4bdb7172c83eaa8430d8d5a273c93b70aac957c24d1725695f34bcdbe7b4c463103553e3b39720f11e3a314e447'
$checksum64 =  '40f04917252d016042119b5a359cb8c6185c5b680861c3fc383fa0fe5bfba3d6b1485f2a2d7429521c60335cc6393036fa1c7893969596302c780e2c4dbca01a'

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
