$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.2.0/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.2.0/TheDesk-setup.exe'
$checksum   = '9d6bc776c0d6b8f3548d152dc604c27efc651bf77725ddf9467cec90a632c5b459e3d95d9a3fc461e9c3ca41eca8f2e35ae8b569784788e086ceed9edbae3ffd'
$checksum64 =  '87a62c9687ed10b8f2d767358adfc07103fbca890431da7bb9baa51702f83ad6d9b227544bb2e022f5d69694392d192e6c36ced8e2348f7eef2378b722cbcb18'

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
