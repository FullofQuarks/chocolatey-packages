Import-Module AU -ErrorAction Stop

$releases = 'https://api.github.com/repos/FullofQuarks/Windows-Ledger-Binaries/releases/latest'

function Get-GitHubHeaders {
    $headers = @{
        Accept               = 'application/vnd.github+json'
        'User-Agent'         = 'FullofQuarks-Chocolatey-AU'
        'X-GitHub-Api-Version' = '2022-11-28'
    }

    if ($env:GITHUB_TOKEN) {
        $headers.Authorization = "Bearer $env:GITHUB_TOKEN"
    }

    return $headers
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum `
        -Algorithm sha256 `
        -Url $Latest.URL
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')" =
                "`$1'$($Latest.URL)'"

            "(^[$]checksum\s*=\s*)('.*')" =
                "`$1'$($Latest.Checksum32)'"

            "(^[$]checksumType\s*=\s*)('.*')" =
                "`$1'sha256'"
        }
    }
}

function global:au_GetLatest {
    $release = Invoke-RestMethod `
        -Uri $releases `
        -Headers (Get-GitHubHeaders) `
        -ErrorAction Stop

    $asset = $release.assets |
        Where-Object { $_.name -eq 'ledger.exe' } |
        Select-Object -First 1

    if (-not $asset) {
        throw "The latest release '$($release.tag_name)' does not contain ledger.exe."
    }

    $version = $release.tag_name -replace '^v', ''

    return @{
        URL            = $asset.browser_download_url
        Version        = $version
        ChecksumType32 = 'sha256'
    }
}

Update-Package -ChecksumFor none
