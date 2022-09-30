$packagename = 'coolterm'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://freeware.the-meiers.org/CoolTermWin.zip'
$checksum = '45d7d0347384257f54aef6fd2fe36e0f7737f695aa312af4ac22ce46dc635edcd4fb46274cc67dd1ff9bd75b351f94720f5aa31b23cd3169d688c052edab3572'
$checksumType = 'sha512'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"