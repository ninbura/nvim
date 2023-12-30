# neovim
blah blah blah

# steps to utilize
1. install llvm + clang
    - **windows**
        - `winget install -i llvm.llvm`
        - make sure to add llvm to your system path via the popup installer
    - **linux**
        - `sudo apt install llvm`
        - `sudo apt install clang`
2. install neovim
    - **windows**
        - `winget install neovim.neovim`
    - **linux**
        - `sudo apt install fuse`
        - install neovim via [these instructions](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux)
        - `sudo mv nvim.appimage /usr/local/bin/nvim`
3. Clone packer into the proper directory, see instructions [here](https://github.com/wbthomason/packer.nvim#quickstart).
4. create and or navigate to the configuration directory
    - **windows** - `cd ~/appdata/local`
    - **linux** - `mkdir -p ~/.config && cd ~/.config`
5. git clone this repository and enter the new directory
    - https - `git clone https://github.com/ninbura/nvim`
    - ssh - `git clone git@github.com:ninbura/nvim.git`
    - `cd nvim`
    - if ssh clone
        - `git config user.name "ninbura"`
        - `git config user.email "gabriel@ninbura.com"`
7. open neovim in said directory
    - `nvim .`
8. ignore errors and run `:PackerSync`
9. quit and re-enter
    - `:q`
    - `nvim .`
