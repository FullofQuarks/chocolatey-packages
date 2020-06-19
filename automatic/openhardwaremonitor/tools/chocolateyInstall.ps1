$packageName = 'openhardwaremonitor'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://openhardwaremonitor.org/files/openhardwaremonitor-v0.9.5.zip'
$checksum = 'ef1d6d5f183150831a1196522d05ba120e2f4904e958c7f00acd8893601f8106a13611a0a71fe3fb938a1c939f70afd941324f542abf54998163809ee8d16166'
$checksumType = 'sha512'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

$shortcutFile = Join-Path -Path $StartMenuDir -ChildPath "OpenHardwareMonitor.lnk"
$workingDir = Join-Path -Path $toolsDir -ChildPath "OpenHardwareMonitor"
$targetExe = Join-Path -Path $workingDir -ChildPath "OpenHardwareMonitor.exe"

Install-ChocolateyShortcut -ShortcutFilePath $shortcutFile -TargetPath $targetExe -WorkingDirectory $workingDir