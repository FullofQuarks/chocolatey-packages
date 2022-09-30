Import-Module au
Import-Module -name ..\..\tools\Get-LatestRelease

$releases = 'https://api.github.com/repos/FullofQuarks/Windows-Ledger-Binaries/releases'

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL
}
function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'" 
        }
    }
}
function global:au_GetLatest {
    $latestRelease_json = Invoke-RestMethod -Uri $releases
    $sourceUrl = $latestRelease_json[0].assets.browser_download_url
    $version = $latestRelease_json[0].name
    
    return @{
        URL = $sourceUrl
        Version = $version
        ChecksumType32 = 'sha512'
    }
}

update -ChecksumFor none
