$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/simonmichael/hledger/releases/download/1.27.1/hledger-windows-x64.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '2467ebdb60c89a6877b735ec34db05d8bf95bf051d38dd4394860bf9efc79f90'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
