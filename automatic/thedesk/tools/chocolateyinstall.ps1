$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.0.10/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.0.10/TheDesk-setup.exe'
$checksum   = '457a4e5629ec02d0e0553ee25bdd040451f78d784fa035bf5166e787f6369f5b1756d18c3228476e3f38e39d2a90a50ace3c3f3c295de418b93130d7eada77f8'
$checksum64 =  'b165f27892304f75a8464b20e80318a68c11623959e9c307da3d20eb67edbacb0ce407cea394ebcedde2f1b270525298323421191275c3d731b40955b51a278e'

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
