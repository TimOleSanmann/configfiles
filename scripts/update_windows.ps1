$SCRIPT_DIR = $PSScriptRoot

$TAGET=$args[0]
$DEFAULT_TARGET=$env:USERPROFILE + "\AppData\Local\nvim"

if ( $TARGET -eq $null){
    $REPLY = Read-Host "No target defined. Use default? [$DEFAULT_TARGET] (y/Y/n/N)"
    if ( $REPLY -eq "y" -or $REPLY -eq "Y") {
        $TARGET = $DEFAULT_TARGET
    }
    else {
        echo "Error: Target Folder must be defined"
        exit
    }
}
cd $SCRIPT_DIR
cd ..
Copy-Item ./init.vim $TARGET\init.vim
Copy-Item -Recurse -Force .\lua $TARGET
