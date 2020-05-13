$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'AltInstaller.msi'
$packageName = 'altserver'

$installPackageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  file          = $fileLocation
  softwareName  = 'AltServer*'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @installPackageArgs
