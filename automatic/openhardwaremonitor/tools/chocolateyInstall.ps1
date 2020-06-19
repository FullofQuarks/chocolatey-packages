$packageName = 'openhardwaremonitor'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://openhardwaremonitor.org/files/openhardwaremonitor-v0.9.3.zip'
$checksum = 'bd2dbde59841ba5012aa0599d3403e5cb20d71ffdf06052f30d4c2d4411b5d6058e6deea8f8366a301e541242837239fba5e1a87fcce2df40223cac445692538'
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