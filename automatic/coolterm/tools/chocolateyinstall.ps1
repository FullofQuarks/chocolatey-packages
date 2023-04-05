$packagename = 'coolterm'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://freeware.the-meiers.org/CoolTermWin32Bit.zip'
$checksum32 = 'a239867abdd9be5c44b2ba5dbfb62ad774732fa7c23cdfd877f665803429158a075993620ffa6d45f3b80eb8f27e686d2d82e8366104f86bae2c956b7d3e2498'
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
