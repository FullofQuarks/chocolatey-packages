$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.3/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.3/TheDesk-setup.exe'
$checksum   = '70c93587ec75dbc95f070ddfd91ee0981c552adb1b238ae043b62e801e4cac801fc9ae2dd8cf761b3e7cc63caf8e981af7ea828c67786d15a08b2fe135e73db6'
$checksum64 =  'c8a771ce75f44aaf88bc4c7b8868c1c9995d1f0723afae8b2b876340eabe4c92ae4d45ecc6d69f0a1aecb69c3c5ba01f6414296d0adbe18fad04a3719331382a'

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
