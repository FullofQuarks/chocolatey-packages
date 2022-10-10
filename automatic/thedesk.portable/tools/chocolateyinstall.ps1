$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v23.0.1/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v23.0.1/TheDesk.exe'
$checksum   = 'aa83b3647e54f1704f04d291cdb84ba2d7cefe5b0e0196ccd81690a37b8b72e7f8dc3d15aaf259f6175bed1e52de817b113581c083c7881e4b4f17cde6e04f16'
$checksum64 =  '02b6d326e5746b0df427f293160759ca81c8abb6a1357927a4ca650d7a7940a0fc312ab18b4a785fd9fbd7fa7e8faa6b4653c1a8a79dd96944630ec47ca0ecea'

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
