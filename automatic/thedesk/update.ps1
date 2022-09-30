Import-Module au

$releases = 'https://api.github.com/repos/cutls/TheDesk/releases'

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL
    $Latest.Checksum64 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL64
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]url64\s*=\s*)('.*')"  = "`$1'$($Latest.URL64)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'" 
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'" 
        }
    }
}
function global:au_GetLatest {
    $latestReleases_json = Invoke-RestMethod -Uri $releases
    $windowsAsset = $latestReleases_json[0].assets | where { $_.name -eq "TheDesk-setup-ia32.exe" }
    $windowsAsset64 = $latestReleases_json[0].assets | where { $_.name -eq "TheDesk-setup.exe" }

    $url = $windowsAsset.browser_download_url
    $url64 = $windowsAsset64.browser_download_url
    $version = $latestReleases_json[0].tag_name.Substring(1)

    return @{
        URL = $url
        URL64 = $url64
        Version = $version
        ChecksumType32 = 'sha512'
        ChecksumType64 = 'sha512'
    }
}

update -ChecksumFor none
