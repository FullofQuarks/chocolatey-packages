$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.6.5/Whalebird-4.6.5-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.6.5/Whalebird-4.6.5-windows-x64.exe'
$checksum   = 'c927e884a16eb077c70b43bffbbc0fc8cb25a9db3d83d856c0ba5071b7b1e556f73ec57ddfb24284fcbe85b63fea054894882647804b90152b6b3a864e95c77d'
$checksum64  = 'b6c3267a37d32400d8ba61498caa433a46431e3581344bb2a79069e2a9bb75d59ca52f901335302f3993a2a780a5ae2b44bd08e2c0b5510c014d0221dfc3e66f'

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
