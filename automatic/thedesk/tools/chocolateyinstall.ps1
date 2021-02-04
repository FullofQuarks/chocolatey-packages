$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'TheDesk'

$url        = 'https://github.com/cutls/TheDesk/releases/download/v22.1.0/TheDesk-setup-ia32.exe'
$url64      = 'https://github.com/cutls/TheDesk/releases/download/v22.1.0/TheDesk-setup.exe'
$checksum   = '73ce533884bb74f0603b52f3062fc7703f85c0bea12870897418a78b9a784af5ce12fd70dd6872d4c696a2cc49b4879dbb11878ccf3397771ce90ea95805c0a2'
$checksum64 =  '20768eb955ac4dd56f211e8fc43803eb541d3a336d983493a786f1b5d0a3a7afdc430fe71abd30024141f465ab6563ad0f01a50804b479134373f2974d3830f3'

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
