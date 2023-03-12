# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias pwd Get-Location
Set-Alias pbcopy clip
Set-Alias nc cnc

# Functions

function cnc {Set-Location "C:\Users\tim-o\AppData\Local\nvim"}



# Configs
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression
Import-Module Terminal-Icons
