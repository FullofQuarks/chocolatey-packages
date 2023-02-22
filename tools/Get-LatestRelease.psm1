###############################################################
# Name:         Get-LatestRelease.ps1
# Description:  Returns a JSON object containing all GitHub releases
# Usage:        Get-Msi-Version.ps1 <Absolute path to MSI>
# Credits:      http://stackoverflow.com/q/8743122/383673
###############################################################
function Get-LatestRelease {
    param ($repo)

    if ($null -eq $repo) {
        throw "Must pass in a repository"
    }

    Write-Host $repo
    
    try {
        # $apiUrl = 'https://api.github.com/repos' + $repo + '/releases'
        # $releases_json = Invoke-RestMethod -Uri $apiUrl
        $sourceUrl = $releases_json[0].assets.browser_download_url
        $version = $releases_json[0].name
        return @{
            URL = $sourceUrl
            Version = $version
        }
    } catch {
        throw "Failed to get latest release: {0}." -f $_
    }
}

Export-ModuleMember -Function Get-LatestRelease