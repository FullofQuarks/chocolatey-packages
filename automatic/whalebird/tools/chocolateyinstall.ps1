$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/v6.3.0/Whalebird-6.3.0-win-x64.exe'
$checksum64  = 'ed5f08d049d0635b3635d687a2fe7c17048b46b4b184d4b6ebb7ac0036a66e07a933c8143b399be7004381abea47c56808ed9400a62c07c04edb49a285313961'

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
