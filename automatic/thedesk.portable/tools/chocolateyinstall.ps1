$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.3.0/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.3.0/TheDesk.exe'
$checksum   = '6754edf7d909a2c9528b011caec8394d523acb4bf8be69b473b3bcdcee713064d149497386c62ef75a4194e88a93cde8d020b0c42d10866bf0f01cd40274ceae'
$checksum64 =  'c5c27088eb9d0b3aba34577d0a5238c605dc721a6a3a1887e7218ac7dd2232bfd212cb9bc5d1559d43c8ed42c627aaf2934ad2daebffb8d628fb1fe102d42c34'

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
