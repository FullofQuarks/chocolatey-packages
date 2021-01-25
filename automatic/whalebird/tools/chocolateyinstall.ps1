$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.3.2/Whalebird-4.3.2-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.3.2/Whalebird-4.3.2-windows-x64.exe'
$checksum   = 'ac91e28e1acba99fb283cfb83f841da43741517d3c12652fa9ddd35acd9ef5516f6908546fa7f52271809d7eed093a06a7f6a1600c0decaebef52661502493d2'
$checksum64  = '8e0ace065a6c33e77c2da334b906189729608ba5db11433bc8d0c676c69b1cc67dccf45d20befcc57fd021ff15af56ee60b6d0fdf8285e6bac966043e8aeda5c'

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
