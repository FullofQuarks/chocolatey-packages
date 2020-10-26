$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/hyperspacedev/hyperspace/releases/download/v1.1.4/Hyperspace.Desktop.Setup.1.1.4.exe'
$checksum   = '8c71aab68ee0461187cda4d1e6d9f60644175836837ea6520600b4f0be8f944ef93f92c9c7ae0ef256619287fc2c5f31158c5f1acde99aeb75f73af9bbef6931'
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
