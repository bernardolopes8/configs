Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme star
Import-Module -Name Terminal-Icons

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

function grep {
    Param ([string]$text,[string]$types,[string]$relativePath)

    $currentPath = Get-Location
    $resolvedPath = Join-Path $currentPath $relativePath

    if ($null -eq $types) {
        $types = "*.*"
    }

    astrogrep /spath="$resolvedPath" /stypes="$types" /stext="$text" /s
}