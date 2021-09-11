$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.4.3/Whalebird-4.4.3-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.4.3/Whalebird-4.4.3-windows-x64.exe'
$checksum   = '922e54fa2fa3dffac395968ab407ae42beb7e37d753ec53821a396f78bda638bf20c26ceb718f582913d731d0ba8424362c3591cee5e1b902c3f47bb06b2904a'
$checksum64  = '03d5629a17732d7199b971f753ca69e6b8d24ae9a28cbaf603f7dde5ee0266a251deef47deaebcf37db0880ba34903ed5d2974c85fac7e1d19d834867c6abd45'

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
