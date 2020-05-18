$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/FullofQuarks/Windows-Ledger-Binaries/releases/download/v3.2.1/ledger.exe'
$packageName = 'Ledger'


$packageArgs = @{
  packageName   = $packageName
  url           = $url
  checksum      = '03cdb6e42381369237cd5ba9ff30025bd848e6474f745200036b9f35fb11c5fd93b9b94f9fea58e0dc62999d9b148e9ecbe8cbf3c31c2df70ee684326526a793'
  checksumType  = 'sha512'
  FileFullPath  = "$toolsDir\ledger.exe"
}

Get-ChocolateyWebFile @packageArgs
