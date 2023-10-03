$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.1.0/Whalebird-5.1.0-win-x64.exe'
$checksum64  = '26946261d7e026f324748a98fb409fb64397210ef2654a4770ab64039fe9b44e05f6ee62fc9a795d347d01296b24ec4943f34108bdd3ca30aa3043eccd36a796'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64

  softwareName  = 'whalebird*'
  checksum64    = $checksum64
  checksumType64= 'sha512'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
