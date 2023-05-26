$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.0.4/Whalebird-5.0.4-windows-x64.exe'
$checksum64  = 'f94c50d79c95c8f5a9680a780eb3ffccb336b927cc068ac07f0035c3b55f309703edba6544ce7c3a2532c4dd4f5ae69df88203368e85441012f35231029f4089'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64

  softwareName  = 'whalebird*'
  checksum64    = $checksum64
  checksumType64= 'sha512'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
