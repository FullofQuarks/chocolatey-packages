$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.0.10/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.0.10/TheDesk.exe'
$checksum   = '04f525a106447f34af39c30e7f396557873163c35092eff12f6aba6613666562710c7a07eb808caa982bc8e32f82af4ec53d238e4cfc1294eff265b935f04300'
$checksum64 =  'fb5b15c1edf91f651034c771cdbafe2a03ba500ead468cee6691c76e027f157308b22a542bec26d56071d2f1493ec49584f988a0c6ecbd4b4d96531570700df2'

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
