Import-Module au

$releases = 'https://api.github.com/repos/simonmichael/hledger/releases'

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha256 $Latest.URL
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
    $windowsAsset = $latestRelease_json[0].assets | where { $_.name -eq "hledger-windows-x64.zip" }
    $sourceUrl = $windowsAsset.browser_download_url
    $version = $latestRelease_json[0].name

    return @{
        URL = $sourceUrl
        Version = $version
        ChecksumType32 = 'sha256'
    }
}

update -ChecksumFor none
