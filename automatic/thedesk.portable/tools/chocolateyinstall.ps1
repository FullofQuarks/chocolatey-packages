$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v22.3.1/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v22.3.1/TheDesk.exe'
$checksum   = '5dda1a5a3eda9b4f700c729ff43494bb9dea6eef30126c8f217873aae482f718c062de443324f7e8528d228988ac37d6bc8629aec2c1904bc034e7fbf086253c'
$checksum64 =  '57b7f7a1344797ecfb3e8104e1690feae7933e2ec64e948e2078fb0f23829e89f097593c6eb4cef05872b6c1e0f49de7dfb78c4e9e20aaaf609ff02d902cac2d'

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
