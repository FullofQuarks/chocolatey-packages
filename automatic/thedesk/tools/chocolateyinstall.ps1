$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.4/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.4/TheDesk-setup.exe'
$checksum   = 'e8d1cd1b6e362b65d3341b99a739c7429575f1e9ca50a3b89e6a6eea9a153718a929102af33f9ec25290f538b84bf161b493a51a931895117d6d60ae59e1e17c'
$checksum64 =  '4d2b3478180e3a8c6087ffe560c85f6ac0bb0f04dca50b44acfbec0c1b2d55ef39d4655b25e31e2f94ed9982d5de2a4c304addf5bd608997de64189e43d8c95c'

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
