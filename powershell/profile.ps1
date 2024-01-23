#Aliases
Set-Alias tt tree
function g { git $args }
Set-Alias c clear
function n { notepad $args }

#Functions which add additional commands
# locate a file/app
function whereis ($command) { 
    Get-Command -Name $command -ErrorAction SilentlyContinue
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

#opens a site
function website ($command) {
    Start-Process "https://$command" 

}

# Unix-like command to create a file
function touch {
    param(
        [string]$Path
    )

    New-Item -ItemType File -Path $Path | Out-Null
}

# Renames a directory (you must be in the parent folder)
function rndir {
    param(
        [string]$OldName,
        [string]$NewName
    )

    Rename-Item -Path $OldName -NewName $NewName
}

# uptime
function uptime {
    If ($PSVersionTable.PSVersion.Major -eq 5 ) {
        Get-WmiObject win32_operatingsystem |
        Select-Object @{EXPRESSION = { $_.ConverttoDateTime($_.lastbootuptime) } } | Format-Table -HideTableHeaders
    }
    Else {
        net statistics workstation | Select-String "since" | foreach-object { $_.ToString().Replace('Statistics since ', '') }
    }
}


#Terminal Icons
Import-Module -Name Terminal-Icons

#Prompt
oh-my-posh init pwsh --config 'E:\Theme\zurly.omp.json' | Invoke-Expression 

#PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function ForwardChar