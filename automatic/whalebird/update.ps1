Import-Module au

$releases = 'https://api.github.com/repos/h3poteto/whalebird-desktop/releases'

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL
    $Latest.Checksum64 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL64
}

function global:au_SearchReplace {
    Write-Host($Latest.Checksum32)
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]url64\s*=\s*)('.*')"  = "`$1'$($Latest.URL64)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'" 
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}
function global:au_GetLatest {
    $latestReleases_json = Invoke-RestMethod -Uri $releases
    $windowsAsset = $latestReleases_json[0].assets | where { ($_.name -like "*windows*ia32*") -and ($_.name -notlike "*shasum*")}
    $windowsAsset64 = $latestReleases_json[0].assets | where { ($_.name -like "*windows*x64*") -and ($_.name -notlike "*shasum*")}

    $url = $windowsAsset.browser_download_url
    $url64 = $windowsAsset64.browser_download_url
    $version = $latestReleases_json[0].name

    return @{
        URL = $url
        URL64 = $url64
        Version = $version
        ChecksumType32 = 'sha512'
        ChecksumType64 = 'sha512'
    }
}

update -ChecksumFor none -NoCheckChocoVersion
