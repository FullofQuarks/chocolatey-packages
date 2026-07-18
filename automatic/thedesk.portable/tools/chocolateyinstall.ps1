$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.2.1/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.2.1/TheDesk.exe'
$checksum   = '1d4466683b92063ca987ddbaefebcc15c09056179efcb646b30ab8b62f90eee54aee4d939f1196b1f9fe2a05efc1567d3a7a5cdf5a9a670cf44b76079e605aa6'
$checksum64 =  '704be0ba891f13a43481cab1d93e4b4991cb6d52a411c1e83f19e2b05759737249486602d1214ff38a46ac7082b70bb2c81dc737b47216e02ebfa25ebb774bfc'

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
