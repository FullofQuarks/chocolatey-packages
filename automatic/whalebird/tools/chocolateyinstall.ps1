$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.2/Whalebird-4.1.2-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.2/Whalebird-4.1.2-windows-x64.exe'
$checksum   = '6bfae5121434cd83f1b575e21bcb9637c011560f4f9ccb487f98e4b6668161c237a05c25dd26d5444cbd62e35965f693c686422bc295a495ecc523c4ae96774a'
$checksum64  = '3c125d9be5d62fc70ab3af1392f00ddcdd084c4f6122fc4100c86822c1ba79c73020399d185dd860cc74ae0e253e2616bfbd920c740bfeb4cfe62a97800a9e9f'

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
