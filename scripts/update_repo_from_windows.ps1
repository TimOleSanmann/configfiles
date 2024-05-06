$SCRIPT_DIR = $PSScriptRoot

$SOURCE=$args[0]
$DEFAULT_SOURCE=$env:USERPROFILE + "\AppData\Local\nvim"

if ( $SOURCE -eq $null ) {
    $REPLY = Read-Host "No target defined. Use default? [$DEFAULT_SOURCE] (y/Y/n/N)"
    if ( $REPLY -eq "y" -and $REPLY -eq "Y") {
        $SOURCE = $DEFAULT_SOURCE
    }
    else {
        echo "Error: Source folder must be defined"
        exit
    }
}

cd $SCRIPT_DIR
cd ..
Copy-Item -Recurse -Force $SOURCE\* .
