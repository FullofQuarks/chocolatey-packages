$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.3/Whalebird-4.1.3-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.3/Whalebird-4.1.3-windows-x64.exe'
$checksum   = '2f064f42c249951c91064aa2e25fef8f8d595a60cab994897b9a2ec13f18c05187ddfc10dd78c6cab8d39bbfcf53936ba8c9259b00f9c2a5d72fff8ec0338619'
$checksum64  = 'e24da06183469e0b82200be2970e27cc7391599707cec0fe6083304095682fbe1825846a78663348b0225b9cce79171d30fc71179984d6d421112f7247bb4796'

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
