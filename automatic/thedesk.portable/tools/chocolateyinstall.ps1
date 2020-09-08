$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.1.1/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.1.1/TheDesk.exe'
$checksum   = 'a341abce9d62329428ed56dbce26d290f40ade903c96049abf2954e949c7885ac5d08332d039729da8a3e07d953f2393bc90191428081deb13dade4beb050785'
$checksum64 =  '7ee5a6414c8e629ccbd1bcbabdc49833e4136a70e5e569e8b03bcd2e288c52545b131c7b682eaa288c4ef579692f0535ac9581b2f867017259f73cfa8959eb96'

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
