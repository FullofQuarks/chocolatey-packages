$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.5/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.5/TheDesk-setup.exe'
$checksum   = 'f71f6a443b37d39615cac2ccbff1809bacb80c947986c1ac04ba28c35c1c18573c015d7ebf1adc2c3802358215e044a40ef37b05b64a4ea0beb624dc374cad5e'
$checksum64 =  'd78fc02ec0a74ff84b154fe2025b95bf05d8e557dc2ecf8e6ec49ff6fd245d985279d7aa592ca9f56f9e1f2963b9de5c3570ce5253959e7ae42f320494d600ea'

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
