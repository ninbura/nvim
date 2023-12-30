# neovim
blah blah blah

# steps to utilize
1. install neovim
    - **windows**
        - `winget install neovim.neovim`
    - **linux**
        - `sudo apt install fuse`
        - `mkdir ~/neovim && cd ~/neovim`
        - install neovim in the `~/neovim` directory (you should be in it) via [these instructions](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux)
2. Clone packer into the proper directory, see instructions [here](https://github.com/wbthomason/packer.nvim#quickstart).
3. create and or navigate to the configuration directory
    - **windows**
        - `cd ~/appdata/local`
    - **linux**
        - `mkdir ~/.config && cd ~/.config`
4. git clone this repository and enter the new directory
    - `git clone https://github.com/ninbura/nvim`
    - `cd nvim`
5. open neovim in said directory
    - `nvim .`
6. ignore errors and run `:PackerSync`
7. quit and re-enter
    - `:q`
    - `nvim .`
