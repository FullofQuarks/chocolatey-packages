$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.3.0/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.3.0/TheDesk-setup.exe'
$checksum   = '292f54a782558919541d84c1f5e99a978324de4809e585cabdfab5adfc1cd5ca6f8a5da3f0d24b3175415a50249dd9900ab4abadf1eb12dfae92e7170f5125d8'
$checksum64 =  'a27df1868757ce0956dffcfb5cb440d5cddc3fe42a98c9fd0e15fed33eecdc5f29b9e0bae0046221817cc42960b94aceaf7d3b690b3330751b0d18f547fb849b'

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
