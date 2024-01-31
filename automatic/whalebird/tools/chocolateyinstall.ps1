$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v6.0.1/Whalebird-6.0.1-win-x64.exe'
$checksum64  = '564224eed99e8bb7c2b74a9b047081f65f1f8aafde93eb539b8781d71396e9359ec992d539268e484420ce465f909a9a7272445e3767d273d7ea1ffd11227efa'

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
