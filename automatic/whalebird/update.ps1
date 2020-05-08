Import-Module au

$releases = 'https://github.com/h3poteto/whalebird-desktop/releases'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]url64\s*=\s*)('.*')"  = "`${1} $($Latest.URL64)"
            "(^*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'" 
            "(?i)(checksum64:).*" = "`${1} $($Latest.Checksum64)"
        }
    }
}
function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = "windows"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href
    $sourceUrl = 'https://github.com' + $url[0]
    $sourceUrl64 = 'https://github.com' + $url[1]
    $version = ($url[0] -split '\/' | select -Index 5).Substring(0)

    return @{
        URL = $sourceUrl
        URL64 = $sourceUrl64
        Version = $version
        ChecksumType32 = 'sha512'
        ChecksumType64 = 'sha512'
    }
}

Update-Package
