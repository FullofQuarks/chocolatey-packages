$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.6/Whalebird-5.0.6-win-x64.exe'
$checksum64  = '2c880cdc7c2bb6e10999c91f3ec66532a9f68aa2077f88f7c53fda58405e38d8528ba48180a106f32784fb50b9e747d39d9f99f272175104c40d1cf01c0688d7'

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
