$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.5.0/Whalebird-4.5.0-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.5.0/Whalebird-4.5.0-windows-x64.exe'
$checksum   = '646828cea475f2b7abc7dc8a68b5117994cee701d27a1f8bffa697e9e6c28b4bd4ce844b1b172bcd73bafc7cde749f4db593bb22e1eee57bed6976711c560925'
$checksum64  = '5562884cc56644790a5e602da33b30003a83ab41a6142435bee6dc22d502030b2bfee51118436155e1fc5b43bb5c47238fad3413fab1cb9ea8415ae44a3ae5d5'

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
