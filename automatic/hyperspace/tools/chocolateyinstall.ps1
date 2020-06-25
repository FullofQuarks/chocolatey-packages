$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/hyperspacedev/hyperspace/releases/download/v1.1.3/Hyperspace.Desktop.Setup.1.1.3.exe'
$checksum   = 'b6440fb5c0a7b14314c26a019ddaa11b9f2fa04e2d11f99b7338255d19ef085163ec3474f96680d534e397352f7edd2396a654f6869cd38761afa1be98710642'
$packageName = 'Hyperspace'


$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'hyperspace*'
  checksum      = $checksum
  checksumType  = 'sha512'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
