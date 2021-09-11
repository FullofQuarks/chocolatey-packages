Import-Module au

$releases = 'https://github.com/simonmichael/hledger/releases'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = 'hledger-windows.zip'
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $sourceUrl = 'https://github.com' + $url
    $version = ($url -split '\/' | select -Index 5).Substring(0)

    return @{
        URL = $sourceUrl
        Version = $version
        ChecksumType32 = 'sha256'
    }
}

update -ChecksumFor none
