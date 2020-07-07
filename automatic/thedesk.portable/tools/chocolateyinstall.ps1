$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.4/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.4/TheDesk.exe'
$checksum   = 'ea63c8d298b8e263643aedce3986ce49d90750c17710addd77c71ea8bf8a90f638d45bcdb9084fa11dee2b3a35d67c07086300db02273a86b214589fbca06961'
$checksum64 =  '1dd65a9b4420284464642c342214f594ffc95831afd9fe335614dfca3f7d8926aec71da5bc524a569052ffb6bccbaa6180309cab00211d33eb0824695248af54'

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
