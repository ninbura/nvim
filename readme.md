# ninbura/nvim
My neovim configuration and how to utilize it.
# sourcing udpated path environment variables
## windows
```powershell
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
```
## linux
```bash
`source ~/.bashrc`
```
# steps to utilize
1. install dependencies
    - **windows**
        - `winget install llvm.llvm`
        - `winget install coreybutler.nvmforwindows`
        - ```powershell
          $currentPATH = ([Environment]::GetEnvironmentVariable("Path")).Split(";")
          $newPATH = ($CurrentPATH + "C:\Program Files\LLVM\bin") -Join ";"
          [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
          $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
          ```
    - **linux**
        - `sudo apt install llvm`
        - `sudo apt install clang`
        - `sudo apt install zip`
        - `sudo apt install fuse`
        - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
        - `source ~/.bashrc`
    - **both**
        - `nvm install node`
2. install neovim
    - **windows**
        - `winget install neovim.neovim`
    - **linux**
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
6. open neovim in said directory
    - `nvim .`
7. ignore errors and run `:PackerSync`
8. quit 💃
