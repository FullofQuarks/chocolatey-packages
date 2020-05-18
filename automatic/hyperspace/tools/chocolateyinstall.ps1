$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/hyperspacedev/hyperspace/releases/download/v1.1.1/Hyperspace.Desktop.Setup.1.1.1.exe'
$checksum   = '1954951aa6f93449918c4f217c3e9b1cf52b45495998a3054c156ec4e0a423edb274f69976c2b95a61696e256a7ec6592676aac9a1988bd5fc31b974d588e3a3'
$packageName = 'Hyperspace'


$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'hyperspace*'
  checksum      = $checksum
  checksumType  = 'sha512'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
