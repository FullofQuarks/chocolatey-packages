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
    $allReleases = Invoke-RestMethod -Uri $releases

    $stableRelease = $allReleases |
        Where-Object {
            -not $_.draft -and
            -not $_.prerelease -and
            ($_.assets.name -contains 'hledger-windows-x64.zip')
        } |
        Select-Object -First 1

    if (-not $stableRelease) {
        throw 'No stable hledger release with a Windows x64 asset was found.'
    }

    $stableAsset = $stableRelease.assets |
        Where-Object { $_.name -eq 'hledger-windows-x64.zip' } |
        Select-Object -First 1

    $stableVersion = Get-Version ($stableRelease.tag_name -replace '^v', '')

    $streams = [ordered]@{}

    $prerelease = $allReleases |
        Where-Object {
            -not $_.draft -and
            $_.prerelease -and
            ($_.assets.name -contains 'hledger-windows-x64.zip')
        } |
        Select-Object -First 1

    if ($prerelease) {
        $prereleaseVersion = Get-Version ($prerelease.tag_name -replace '^v', '')

        if ($prereleaseVersion -gt $stableVersion) {
            $prereleaseAsset = $prerelease.assets |
                Where-Object { $_.name -eq 'hledger-windows-x64.zip' } |
                Select-Object -First 1

            $streams['prerelease'] = @{
		Version        = "$($prereleaseVersion)-pre"
                URL            = $prereleaseAsset.browser_download_url
                ChecksumType32 = 'sha256'
            }
        }
    }

    $streams['stable'] = @{
        Version        = $stableVersion
        URL            = $stableAsset.browser_download_url
        ChecksumType32 = 'sha256'
    }

    Write-Host 'Streams discovered:'

    $streams.GetEnumerator() | ForEach-Object {
        Write-Host "  $($_.Key):"
	Write-Host "    Version: $($_.Value.Version)"
	Write-Host "    URL:     $($_.Value.URL)"
    }
    return @{
        Streams = $streams
    }
}

update -ChecksumFor none
