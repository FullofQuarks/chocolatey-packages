$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v5.1.1/Whalebird-5.1.1-win-x64.exe'
$checksum64  = '444bb1d76bccceb69a3847593a7f4dc14499b452a14dcbe83e7070bc864059d58733345669633bc2a0ce3d710254d42031058f560502302a28b6a89725343fef'

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
