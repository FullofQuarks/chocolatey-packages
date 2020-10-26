$packagename = 'coolterm'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://freeware.the-meiers.org/CoolTermWin.zip'
$checksum = '2c4b4749742d8707ba3c7a502090243f9b7db97ff49732b384e4d174a63c1a242accee22cb30f70e0369b63a260f7dbd553e9e3e214c0db75a58d65ab84fdc51'
$checksumType = 'sha512'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"