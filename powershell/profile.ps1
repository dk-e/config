#Terminal Icons
Import-Module -Name Terminal-Icons

#Prompt
oh-my-posh init pwsh --config 'E:\Theme\zurly.omp.json' | Invoke-Expression 

#PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function ForwardChar
