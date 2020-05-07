$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v20.3.3/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v20.3.3/TheDesk-setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/S"

  softwareName  = 'thedesk*'
  checksum      = '38266e37b521b3168cf3883f0196b9ff859dbde47e58256a82c8e84df18e1b2ca8559ef8d19a5995a68830cf175f1f05cebaefa786be39e9da00a17ca739dce2'
  checksumType  = 'sha512'
  checksum64    = '446235a502804e8940fb8a21571ce97845e6855470387453d7a429198d14dfd1abec2d78c3168c81f7cbcd41a6159b90513b4fd7b4d73ebed527a99066248483'
  checksumType64= 'sha512'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs