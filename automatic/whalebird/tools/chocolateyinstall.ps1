$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.2/Whalebird-4.2.2-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.2/Whalebird-4.2.2-windows-x64.exe'
$checksum   = 'caa1495ed56cb3bc00ee0473a3226a1c73aba651dc83fd89f98640504b3f969098277c8f9af18d3316002cb839a658970d77313780b6d15a44405994bb47af53'
$checksum64  = 'fc64e0bb9967df8efb207905056897bcce3b6c2b4febe63a38fd053421978b2fac6f82103902228eb0a34b45d45b4ca3c045920bce7df4246d32d8e6025cf148'

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
