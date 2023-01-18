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
# Interesting Websites
[Vim Cheat Sheet](https://vim.rtorr.com/)

[Neovim Command Index](https://neovim.io/doc/user/vimindex.html)

[Neovim Terminal Commands](https://neovim.io/doc/user/nvim_terminal_emulator.html)
