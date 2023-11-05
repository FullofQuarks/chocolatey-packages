$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.1.5/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.1.5/TheDesk.exe'
$checksum   = 'cb1ed762a00f082cc00b2370d5a155befe891023d592cf86e308be709e472398f5b85907a9d404da9ca9ef568f6e1644bc83b1cf06559dfc4dd9df9842d7da3a'
$checksum64 =  'cce0212359ca9b511d20c3c7b1af8790d458b568a97ba7c03cafd4c8808959bb3cbe7d6a2cef49da67be8c0c218e6a721e63e956db405e0bf2cad015a5bb293b'

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
