Import-Module au

$releases = 'https://api.github.com/repos/simonmichael/hledger/releases'

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha256 $Latest.URL
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $releasesJson = Invoke-RestMethod -Uri $releases

    $latestRelease = $releasesJson |
        Where-Object { -not $_.prerelease -and -not $_.draft } |
        Select-Object -First 1

    $windowsAsset = $latestRelease.assets |
        Where-Object { $_.name -eq "hledger-windows-x64.zip" }

    return @{
        URL            = $windowsAsset.browser_download_url
        Version        = $latestRelease.tag_name
        ChecksumType32 = 'sha256'
    }
}

update -ChecksumFor none
