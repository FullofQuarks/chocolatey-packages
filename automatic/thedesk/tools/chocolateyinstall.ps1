$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v21.2.4/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v21.2.4/TheDesk-setup.exe'
$checksum   = '6b3091875c07069f335854f74e467dbd0a4e105a5f5976b752365ec8bc8c1dd9d088e8da1203621a0e1e1b4b9375a6da9b557a39e2cad6a9f4d82402c66ea059'
$checksum64 =  '337b74cac0f1515cf5e6baa90375604561b658d988ae4f6e4cc774aba40e721f131dcef9405913286b5dc708dc917265fd102f51abea9f7f39ef947126244c96'

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
