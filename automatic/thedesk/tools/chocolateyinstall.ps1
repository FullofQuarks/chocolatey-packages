$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.0.1/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.0.1/TheDesk-setup.exe'
$checksum   = '5f4b3edefc4086c3810456b86168d3f802e96d61101269333e3159c375c1978a48b1820bec461f508d6eaeac9bf8966d0701365a7e406fe47161b4427bee2af0'
$checksum64 =  '11eca0cba96b4fbae98fca599cdc2282b9769faf125239121c7a83d395bf2a4cdbe9a69413471244418184d7ae60838e4a68b7a16609e877944f1e9ceb7c9e04'

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
