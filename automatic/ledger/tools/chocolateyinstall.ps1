$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/FullofQuarks/Windows-Ledger-Binaries/releases/download/v3.3.2/ledger.exe'
$packageName = 'Ledger'


$packageArgs = @{
  packageName   = $packageName
  url           = $url
  checksum      = '6d7ea1964a3f1738587ff81f26121f80ff9b7b9e80026e1ee954ef36fce37c77a93bd369900b813c6be5b2facdbf2104dbabd948ec9908e7c8379c8fa0674cab'
  checksumType  = 'sha512'
  FileFullPath  = "$toolsDir\ledger.exe"
}

Get-ChocolateyWebFile @packageArgs
