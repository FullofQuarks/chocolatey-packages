$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.2/Whalebird-5.0.2-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.2/Whalebird-5.0.2-windows-x64.exe'
$checksum   = '0b5ed6c2a60dff3f925a71123cec133223ea67ac52c85886c9b5ed3338c07e14d973b77d5b25a7b6760d36c0a2aa71908d50958b7d32544f087b303623a8d1c4'
$checksum64  = 'd1b3004ce2debeac21b9564939c3f02f4f7a5e9fc4ad79a456e3bb617d2445e15def614f9f7b04a5c29b9773881eeffa95345dd0b403710517dc82984edad61f'

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
