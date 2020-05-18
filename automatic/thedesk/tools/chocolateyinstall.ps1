$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.0/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.0/TheDesk-setup.exe'
$checksum   = 'a969bc8e4a687197000417691f65f64a155bf5f05f404ea96c2f3e67b07a4e6d74a9bb1920bd8f24690af85a96c476a23e298cae884675cbffd1f235428db0e9'
$checksum64 =  '101a23ae1526441f76d8693e778cf90419432802ed0b1de6e06b6c95597c2fca470f10f4738355108d1df5b9c1f31088570a82210b02ad8ff90bb0e86ef55a35'

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
