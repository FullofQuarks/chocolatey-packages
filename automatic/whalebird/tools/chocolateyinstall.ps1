$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url        = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.0/Whalebird-4.1.0-windows-ia32.exe'
$url64      = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.1.0/Whalebird-4.1.0-windows-x64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'whalebird*'
  checksum      = '8770899321483bf164c8edd3d2e99ba01d6dc01d7d338342218ed5641ce7644e8c8a01070906e69d3b96709b208f1e52940227da8734fcce221c2c664a102439'
  checksumType  = 'sha512'
  checksum64    = '2fcfdc9b6851bf7065fa24288c56bd7102cad454d6f5faf149c8799c14328a054acfd472d87d0ea428408126c516b9fc568dc5ed644069b9a241471337dc1bde'
  checksumType64= 'sha512'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
