$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.1.6/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.1.6/TheDesk.exe'
$checksum   = 'bfeb43199a040393cf30b97f8b536bd4e2b3cf692656a3dae14455a8f40a953049b9c16427f5a4dceec85aa66ca55639d649195de8a3741c12b947934d31be5e'
$checksum64 =  'df15a2a9321bd285703f1aa7d4a46c57829d5ce7c21c92e9dec391f455c7e4d053e51fead7663cd275388364e83ef20768a2e2c38fe550d826ef72a6008fd458'

$packageArgs = @{
  packageName   = $packageName
  url           = $url
  url64bit      = $url64
  checksum      = $checksum
  checksumType  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'
  FileFullPath  = "$toolsDir\thedesk.exe"
}

Get-ChocolateyWebFile @packageArgs
