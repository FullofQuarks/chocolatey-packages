Import-Module au

$releases = 'https://api.github.com/repos/h3poteto/whalebird-desktop/releases'

function global:au_BeforeUpdate() {
    $Latest.Checksum64 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL64
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"  = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}
function global:au_GetLatest {
    $latestReleases_json = Invoke-RestMethod -Uri $releases
    $windowsAsset64 = $latestReleases_json[0].assets | where { ($_.name -like "*win*x64*") -and ($_.name -notlike "*shasum*") -and ($_.name -notlike "*.blockmap")}

    $url64 = $windowsAsset64.browser_download_url
    $version = $latestReleases_json[0].name

    return @{
        URL64 = $url64
        Version = $version
        ChecksumType64 = 'sha512'
    }
}

update -ChecksumFor none -NoCheckChocoVersion
