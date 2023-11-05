$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v24.1.5/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v24.1.5/TheDesk-setup.exe'
$checksum   = 'ff67236bb0e5794b96587bd205343f4e2de2b0155d5590be0210442fba7cbeba9ecbc9f40aae029ce20eb29af9efb1e52279a0b98c05cbb905fe19b06e695da9'
$checksum64 =  'de417207992cdcd60023acd1478c741e2a9212264b6f9cf98f1d76ac4053edd2ba8b856764a46eebe324d1ff7b164b391d38d8ddb92edb9791213e136e1b3689'

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
