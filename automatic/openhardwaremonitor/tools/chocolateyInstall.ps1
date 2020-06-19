$packageName = 'openhardwaremonitor'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://openhardwaremonitor.org/files/openhardwaremonitor-v0.9.4.zip'
$checksum = '13168f962204cbc93405784d7b0636bf29bbdc1f6ffa8456fe6bb736045570b8cca16040eae51b099d9a452c0de5949ee0e0bcef51d11fceade18509da3d5c99'
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