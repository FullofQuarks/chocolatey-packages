$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.1.3/TheDesk-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.1.3/TheDesk.exe'
$checksum   = 'babdd56375eff12c3fdaec84a9f2e3f318d33be19d25a1d589deaf98ab6c554c72d5178b3ff9a1cc31a455f5fcb58a973f86e21ddfb4de8441b9a4db13de8915'
$checksum64 =  '8a171e7755633480cbe536d164f0b89791ace6ae42b12ddf681c84a8a734671c353c79b785648c12aa25d7229bc205bc483a315a65814002bfe4f03fba343dc5'

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
