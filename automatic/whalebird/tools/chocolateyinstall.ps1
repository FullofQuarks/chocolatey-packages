$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.3/Whalebird-5.0.3-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.3/Whalebird-5.0.3-windows-x64.exe'
$checksum   = '25a4acf37f98d9258065aa56bdf1d670ed84a6b0d46fdf9ab3de1d6c678fc61e65b8f111e2c8264a6546861190c8a2d2752cc4e3f2d56d120b1ef3900e53a20f'
$checksum64  = '22dc588baf90e740377cd94fefc037342377447e3aedf3e9463ee2b30626c6730f3cc4419b74f6686b40739fc59ecd855974063e00431a80f6d113b84932bbb6'

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
