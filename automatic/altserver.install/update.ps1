Import-Module AU

$URL = "https://f000.backblazeb2.com/file/altstore/altinstaller.zip"
$rootDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$toolsDir = Join-Path $rootDir "tools"
$auToolsDir = Join-Path $PSScriptRoot "tools"
$downloadedFileLocation = Join-Path $toolsDir 'AltInstaller.zip'
$unzippedFile = Join-Path $toolsDir 'AltInstaller.msi'

function global:au_BeforeUpdate {
    Invoke-WebRequest -Uri $URL -OutFile $downloadedFileLocation
    Get-ChocolateyUnzip -FileFullPath $downloadedFileLocation -Destination $toolsDir
    $res = Get-FileHash $unzippedFile -Algorithm sha512
    $Latest.Checksum32 = $res.Hash.ToLower()
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt" = @{
            "(checksum:\s*)(.*)" = "`$1'$($Latest.Checksum32)'" 
        }
    }
}
function global:au_GetLatest {
    $beforeVersion = (& "$PSScriptRoot\..\..\tools\Get-Msi-Version.ps1" $unzippedFile) | Out-String
    $version = $beforeVersion.Substring(0,5)

    return @{
        Version = $version
        ChecksumType32 = 'sha512'
    }
}

update -ChecksumFor none
