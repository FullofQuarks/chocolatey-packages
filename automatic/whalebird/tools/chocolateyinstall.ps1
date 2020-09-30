$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.3/Whalebird-4.2.3-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.3/Whalebird-4.2.3-windows-x64.exe'
$checksum   = '1748c2e9691e9c72fbee9e8098e17ac58ff0c01396dbe6928900fdc1490e24d61f10a086c38914d0b83ddd94b8d3558f3a9451c2695f8d723ec116c5e119a8b2'
$checksum64  = 'df9ae8cfc227ffedaf04b36f8030f3230ce424b45ad3ccdc0db2787821c761e56996304132c3458a81c4045ad52326dd49481e0aabca7d45f4cbd333bb6d097f'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'whalebird*'
  checksum      = $checksum
  checksumType32  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
