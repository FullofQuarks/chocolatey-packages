$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v22.0.1/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v22.0.1/TheDesk.exe'
$checksum   = '7f0fd01e1e2a1b28fdefb05f53accb1a5ccd984af00803f7bb1c0a7cc0bdff430e6f1721255229981c5fbc7a2e4b67a63a1f39483121134065ac62dcf3435ecf'
$checksum64 =  '37c91d07d056c9dc5d9ba2f37a95ee04f0481c95c5176e310fc093a58f3065a3c91316c58bd6d0f59f8e4376795d2838a2240a4c0079902e17c92ada9a8a563d'

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
