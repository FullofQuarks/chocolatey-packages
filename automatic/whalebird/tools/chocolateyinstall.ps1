$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.1/Whalebird-4.1.1-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.1/Whalebird-4.1.1-windows-x64.exe'
$checksum   = 'a8d098fbbdfca48dc1a03ba89dc5efd3b93cc3eabf26764b0235fac91ed39d1557022c5f57881d8329a22e506559d16492cc6c5e1b4dcc19806fa8e188821eb8'
$checksum64  = '3d289f045bb52a55de1de9037225e1d68004c2c2324ee1cfceb401580eeebd039c384c351a3a90abd2d9841eb79904fe0016bb3fe1464fc88ab8451856d57d25'

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
