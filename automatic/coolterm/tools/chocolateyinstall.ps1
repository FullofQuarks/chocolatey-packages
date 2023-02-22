$packagename = 'coolterm'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://freeware.the-meiers.org/CoolTermWin32Bit.zip'
$checksum32 = '0f12af99ed59fd016849006587269df9a0cc361d081c3cac7dfd8522fbad4b1da25c41e4781ff28361692a95e2406082d20345228fd5d54db4ca70f9d2068186'
$url64 = 'https://freeware.the-meiers.org/CoolTermWin.zip'
$checksum64 = '8a4391b4ad2a05873e977e50ca0d186e63ff7e227083604582f0b0d639e5f5094da52a16f22677a08628bac151face68af79901ee3317f5a43711184baa9c532'
$checksumType = 'sha512'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType"