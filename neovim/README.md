# Configuration
## Install neovim
## Install Plug
## Install Plugins
Enter following command in neovims commnand mode
```
:PlugInstall
```
## Install additional helpers
### Pyright
```
npm install -g pyright
```
### tsserver
```
npm install -g typescript typescript-language-server
```
### coffeesense (coffeescript)
```
npm install -g coffeesense-language-server
```
### HTML
```
npm i -g vscode-langservers-extracted
```
### Bash 
```
npm i -g bash-language-server
```
### Go
This step requires go to be installed. Additionally, it could be possible, that you have to add go to you path.
```
go install golang.org/x/tools/gopls@latest
```
For debugging, you also have to install delve:
[Delve Installation](https://github.com/go-delve/delve/tree/master/Documentation/installation)
### Yarn
```
npm i -g yarn
```
### Ripgrep
Make sure, that ripgrep is install, because it is the grep tool used by telescope
#### Mac
```
brew install ripgrep
```
# Script usage
Automatical update for the local neovim configuration if the repository is not cloned directly to the used directory
## Unix
```
./scripts/update_unix.sh
```
Automatical update the repository from the local configuration
```
./scripts/update_repo_from_unix.sh
```
## Windows
Automatical update for the local neovim configuration if the repository is not cloned directly to the used directory
```
.\scripts\update_windows.ps1
```
Automatical update the repository from the local configuration
```
.\scripts\update_repo_from_windows.ps1
```
# Interesting Websites
[Vim Cheat Sheet](https://vim.rtorr.com/)

[Neovim Command Index](https://neovim.io/doc/user/vimindex.html)

[Neovim Terminal Commands](https://neovim.io/doc/user/nvim_terminal_emulator.html)
