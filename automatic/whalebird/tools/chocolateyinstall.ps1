$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.1/Whalebird-4.2.1-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.2.1/Whalebird-4.2.1-windows-x64.exe'
$checksum   = 'a40d67ef6ca88a5df862ebbf9710466d7829fb13c5a8046537ca3d6a0b54ee1dbb33a144eaa475c7c5dfd2f9254413724d495fcc1bc3510ef8dc22ce15c0dcf2'
$checksum64  = 'd67d39ea693dde81a1f7927cb31b1d22e4f7cef95ca95b06139ce37ba2365bec7ce9718e3757c014b31158eb1782d00d56a7b92eb1f2730b86aa04352dc8a018'

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
