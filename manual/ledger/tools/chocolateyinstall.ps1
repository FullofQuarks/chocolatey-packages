$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/AlexanderAA/ledger_binaries_windows/raw/master/ledger_3.2.0_win_bin.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = $url
  softwareName  = 'ledger*'
  checksum      = '039a050ca1c43114dc4947cb2e4de9ec565fe906259c96101aa08bc474f42506ab8380f2d2a41e44309f64893d15d5be3ad18baec4a3f57d2980d6b073ba0422'
  checksumType  = 'sha512'
}

Install-ChocolateyZipPackage @packageArgs