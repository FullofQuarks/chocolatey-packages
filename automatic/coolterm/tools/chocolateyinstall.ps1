$packagename = 'coolterm'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://freeware.the-meiers.org/CoolTermWin32Bit.zip'
$checksum32 = '0f12af99ed59fd016849006587269df9a0cc361d081c3cac7dfd8522fbad4b1da25c41e4781ff28361692a95e2406082d20345228fd5d54db4ca70f9d2068186'
$url64 = 'https://freeware.the-meiers.org/CoolTermWin64Bit.zip'
$checksum64 = 'e1453b5c52d284233c2b3a6a9e690056e4007d9925db641b1bcdf8c4314ce8a00237c64ad2ad58fd1ec122a393b6bff9df0410568c9c3335a647370adff118e2'
$checksumType = 'sha512'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType"
