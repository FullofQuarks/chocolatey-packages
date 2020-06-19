$packageName = 'openhardwaremonitor'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://openhardwaremonitor.org/files/openhardwaremonitor-v0.9.1.zip'
$checksum = '02026eef8a454e7d6f468f195c071ef1e6a96e7e340d3977f99ae11ad445ac03d34155c48fc437a9ab67e390a0e56b924fd955bd17460b15c3520b36162d5e19'
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