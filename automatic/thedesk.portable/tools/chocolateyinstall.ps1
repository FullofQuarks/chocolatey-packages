$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.2.0/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.2.0/TheDesk.exe'
$checksum   = '4698566ea74c41af1a99dbee8bbef0534e0235d665c258dfe6f6a3c953dcb57a7ca9a6290f24bd97865c30226f221caa7d1584d1b6efacf0eb01334e286a4c5c'
$checksum64 =  '501e39d64ff180f0d0585ce678f5ccbdff82c20a96eb84b698d1f0f5ca150b7231bcfe353cf6f90e5c3c12c2e75fbf75f08cc8665f8f3ad787c18d305fc92724'

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
