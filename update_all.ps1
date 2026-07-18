<#
.SYNOPSIS
    Updates and publishes the automatic Chocolatey packages in this repository.

.DESCRIPTION
    Uses the community-maintained Chocolatey-AU module to check packages under
    the specified root, update package files, optionally push packages to
    Chocolatey, generate reports, and persist successful changes to Git.

.EXAMPLE
    .\update_all.ps1

.EXAMPLE
    .\update_all.ps1 -Name ledger

.EXAMPLE
    .\update_all.ps1 -ForcedPackages "ledger ledger.portable:3.4.0"
#>

[CmdletBinding()]
param(
    [string[]] $Name,

    [string] $ForcedPackages,

    [ValidateScript({ Test-Path -LiteralPath $_ -PathType Container })]
    [string] $Root = (Join-Path $PSScriptRoot 'automatic')
)

$ErrorActionPreference = 'Stop'

Import-Module Chocolatey-AU -ErrorAction Stop

$updateVariablesPath = Join-Path $PSScriptRoot 'update_vars.ps1'
if (Test-Path -LiteralPath $updateVariablesPath -PathType Leaf) {
    . $updateVariablesPath
}

$repository = if ($env:GITHUB_REPOSITORY) {
    $env:GITHUB_REPOSITORY
}
else {
    $env:github_user_repo
}

$forcedPackageList = @(
    $ForcedPackages -split '\s+' |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
)

$pushPackages = $env:au_Push -eq 'true'
$gitToken = if ($env:GITHUB_TOKEN) {
    $env:GITHUB_TOKEN
}
else {
    $env:github_api_key
}

$options = [ordered]@{
    WhatIf       = [bool] $au_WhatIf
    Force        = $false
    Timeout      = 120
    UpdateTimeout = 1800
    Threads      = 1
    Push         = $pushPackages
    PushAll      = $true
    PluginPath   = ''

    Report = @{
        Type = 'markdown'
        Path = Join-Path $PSScriptRoot 'Update-AUPackages.md'
        Params = @{
            Github_UserRepo = $repository
            NoAppVeyor      = $true
            UserMessage     = '[History](#update-history)'
            NoIcons         = $false
            IconSize        = 32
            Title           = 'Chocolatey Package Update Report'
        }
    }

    History = @{
        Lines           = 30
        Github_UserRepo = $repository
        Path            = Join-Path $PSScriptRoot 'Update-History.md'
    }

    RunInfo = @{
        Exclude = @('password', 'apikey', 'token')
        Path    = Join-Path $PSScriptRoot 'update_info.xml'
    }

    ForcedPackages = $forcedPackageList

    BeforeEach = {
        param($PackageName, $Options)

        $escapedPackageName = [regex]::Escape($PackageName)
        $forcedPackage = $Options.ForcedPackages |
            Where-Object { $_ -match "^${escapedPackageName}(?::(.+))?$" } |
            Select-Object -First 1

        if (-not $forcedPackage) {
            return
        }

        $global:au_Force = $true

        $separatorIndex = $forcedPackage.IndexOf(':')
        $global:au_Version = if ($separatorIndex -ge 0) {
            $forcedPackage.Substring($separatorIndex + 1)
        }
        else {
            $null
        }
    }
}

# The Git plugin persists package/report changes after AU successfully publishes.
# GitHub Actions supplies GITHUB_TOKEN; local runs may use github_api_key instead.
if (-not [string]::IsNullOrWhiteSpace($gitToken)) {
    $options['Git'] = @{
        User     = ''
        Password = $gitToken
    }
}
else {
    Write-Warning 'No GitHub token was found. Package changes will not be committed or pushed to Git.'
}

if ($forcedPackageList.Count -gt 0) {
    Write-Host "Forced packages: $($forcedPackageList -join ', ')"
}

Write-Host "Package root: $Root"
Write-Host "Push to Chocolatey: $pushPackages"

$global:au_Root = $Root
$global:info = Update-AUPackages -Name $Name -Options $options

$errorCount = [int] $global:info.error_count.total
if ($errorCount -gt 0) {
    throw "Chocolatey-AU reported $errorCount package update error(s). See Update-AUPackages.md and update_info.xml."
}
