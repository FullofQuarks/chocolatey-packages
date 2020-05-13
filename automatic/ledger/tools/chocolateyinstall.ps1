$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/FullofQuarks/Windows-Ledger-Binaries/releases/download/v3.2.0/ledger.exe'
$packageName = 'Ledger'


$packageArgs = @{
  packageName   = $packageName
  url           = $url
  checksum      = 'dce0c61d61ded5ead12080038a3aced335cab18044434b7ea45169168686b458c62c23ae0fcb974f125d15a548d057c1c356122e27fb5c311dba0b14128c1013'
  checksumType  = 'sha512'
  FileFullPath  = "$toolsDir\ledger.exe"
}

Get-ChocolateyWebFile @packageArgs
