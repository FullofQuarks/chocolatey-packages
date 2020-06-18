$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/hyperspacedev/hyperspace/releases/download/v1.1.2/Hyperspace.Desktop.Setup.1.1.2.exe'
$checksum   = '88d90b0b6a058266796fa170fa61e16e8dd7597c6934b0a8882d611147881d2875fc05e775623910ebf3340c8a4d61537d7c4d68df44cd9620a0bd7199436c88'
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
