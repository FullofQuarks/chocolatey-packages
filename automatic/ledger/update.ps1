Import-Module AU -RequiredVersion 2022.10.24 -ErrorAction Stop

$releasesUrl =
    'https://api.github.com/repos/FullofQuarks/Windows-Ledger-Binaries/releases/latest'

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum `
        -Url $Latest.URL `
        -Algorithm sha256
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')" =
                "`$1'$($Latest.URL)'"

            "(^\s*checksum\s*=\s*)('.*')" =
                "`$1'$($Latest.Checksum32)'"

            "(^\s*checksumType\s*=\s*)('.*')" =
                "`$1'sha256'"
        }
    }
}

function global:au_GetLatest {
    $release = Invoke-RestMethod `
        -Uri $releasesUrl `
        -Headers @{ 'User-Agent' = 'Chocolatey-AU' }

    $asset = $release.assets |
        Where-Object { $_.name -eq 'ledger.exe' } |
        Select-Object -First 1

    if (-not $asset) {
        throw "Release '$($release.tag_name)' does not contain ledger.exe."
    }

    @{
        URL     = $asset.browser_download_url
        Version = $release.tag_name -replace '^v', ''
    }
}

Update-Package -ChecksumFor none
