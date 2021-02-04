$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v22.1.0/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v22.1.0/TheDesk.exe'
$checksum   = 'd48cd2948b0ca866fafd47cd5e57397217a3b8c30cc5360a0825fe89c160010e004b6125aa67784407440d7dc59427e1c9cbbff2531461a786df9d856f43142f'
$checksum64 =  'f8415601b2bdb63a29c525f17a020ae7184b4d0f3111ede54eabab721481e16f22937e0be795726f7db7c887d8d2809809760f0abd2ac759b9bf47490e28811c'

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
