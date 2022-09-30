$packagename = 'coolterm'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://freeware.the-meiers.org/CoolTermWin32Bit.zip'
$checksum32 = 'ee207996a7414fb18c06336687cb65beb864436f5e7e1050a8a8c6fee848ee743cdc2576cb9cda5f6a0c8396b06b740f82effdda0fd2ab383c5ac584496d8abf'
$url64 = 'https://freeware.the-meiers.org/CoolTermWin.zip'
$checksum64 = '5416dc14b2f346a5164d981b6638a2203f327c90f6bae739f7da2156789c1c38945230e081e180644c8c69e0bd5005f5cd209a38461644c132400fd3389db5cb'
$checksumType = 'sha512'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType"