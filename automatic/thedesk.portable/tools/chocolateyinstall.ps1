$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.2.4/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.2.4/TheDesk.exe'
$checksum   = '9540ffd8261fc4e3892ab424348b5607b51ac86cf0164a6b3e6206aa1499b3a830bdb1c34f3ec144f342e3dc0de08c00965310ad24a7262b777b503f0d01ec46'
$checksum64 =  'd2b6106801ce30dff672130ef3657a40513b1fb9b84e8edb80f6199ecbaf48af8e7cefd7192b9f6c76e0e1be7509de8024087da9a9d40f0af7ac9aa21a632e68'

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
