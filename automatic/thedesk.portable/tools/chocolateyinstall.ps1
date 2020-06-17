$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.3/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.3/TheDesk.exe'
$checksum   = '94f9ccb0582d84ed78dd2d74eb3527902d0d5d02e51494f1869ea63f80acd6f110790530a805278bf884f6d025cf10f92ec852fd3cd851781a7e1cca405deca1'
$checksum64 =  '4239ff8d2dc1bd74ff9e66fd8c693bc634bbfa29cb96c90b5c0487d0a2117d8cd401cfaad242abdbf5c7e310f5dc628c8441a93e45f51cbc80cfc475c68c34b2'

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
