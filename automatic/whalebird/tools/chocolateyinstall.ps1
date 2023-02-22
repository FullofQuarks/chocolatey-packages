$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.7.4/Whalebird-4.7.4-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.7.4/Whalebird-4.7.4-windows-x64.exe'
$checksum   = 'fa456a72c8f41d9a1856697a731e8fe37937282402c0e59cb10333b5291a33844a98bb0427a7952839deb9c4072eca718e1c7307ac946649a0f6c44ed3521923'
$checksum64  = '4c70b8f377641e539341cc75c6e174a765ce0c4cfdf7a14cdac7e0b86f8e5bbc92c6c433a0fd8a1deb7fdf52f5e7f4e06e0bd3f5fe66f71376085f085674eb1e'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'whalebird*'
  checksum      = $checksum
  checksumType32  = 'sha512'
  checksum64    = $checksum64
  checksumType64= 'sha512'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
