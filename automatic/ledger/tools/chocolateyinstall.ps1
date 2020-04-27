$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/AlexanderAA/ledger_binaries_windows/raw/master/ledger_3.1.3_win_bin.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = $url
  softwareName  = 'ledger*'
  checksum      = 'a04eecbb30f945cf53aed78d433fa694b93f073a324af3e240d15ee94fcbf20d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs