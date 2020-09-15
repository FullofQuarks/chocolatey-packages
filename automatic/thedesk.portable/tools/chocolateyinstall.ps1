$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.2.2/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.2.2/TheDesk.exe'
$checksum   = 'cf119ff19ae982e16eca666b1d0f0dc2836a40a0cbc691e029690b78dc984a5972a41ecef291317c5cb3e0647737315e968f16f932a8c2a53e0d4e0f4cc17b17'
$checksum64 =  '98ccff6f2ef176df1867fe1c39dbf8ab8984bdbf665ceb38d5ddac379c7a896f4cf54da492382acc1d48335a1375a3803f61f595b0381d7fd4cd46aafeddbc52'

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
