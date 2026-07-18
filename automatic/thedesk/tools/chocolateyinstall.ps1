$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.2.1/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.2.1/TheDesk-setup.exe'
$checksum   = 'b93e913c274a2efb1801873f698792a44e310286a52120ccbbbfce946063d76e0b35ddf28b71ccc6445749be6849d9513589f384cb95a8c8e3e6a261933ba74c'
$checksum64 =  '0987fbc7f93b01a5ec5daa764a8f8e7ac29f06c88636f4081be10fb0a91eaa10e37b24b871749b470dbc67af0a3fb1a0f2cd3a96e3e777187987a4004ef9508e'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/S"

  softwareName  = 'thedesk*'
  checksum      = $checksum
  checksumType  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
