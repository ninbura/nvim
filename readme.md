# ninbura/nvim
My neovim configuration and how to utilize it.
# steps to utilize
1. install dependencies
    - ### windows
        - ```powershell
          # with professional license
          winget install microsoft.visualstudio.2022.professional --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          # without professional license
          winget install microsoft.visualstudio.2022.community --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
        - `winget install llvm.llvm`
        - `winget install coreybutler.nvmforwindows`
        - ```powershell
          $currentPath = ([Environment]::GetEnvironmentVariable("Path"))
          
          if($currentPath.ToLower() -notmatch "llvm\\bin") {
              $splitPath = $CurrentPath.Split(";")
              $newPath = ($splitPath + "C:\Program Files\LLVM\bin") -Join ";"
              [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
              $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
          }
          ```
    - ### linux
        - `sudo apt install llvm`
        - `sudo apt install clang`
        - `sudo apt install zip`
        - `sudo apt install fuse`
        - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
        - `source ~/.bashrc`
    - ### both
        - `nvm install latest`
        - `nvm use latest`
2. install neovim
    - ### windows
        - `winget install neovim.neovim`
        - ```powershell
          $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")`
          ```
    - ### linux
        - install neovim via [these instructions](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux)
        - `sudo mv nvim.appimage /usr/local/bin/nvim`
3. Clone packer into the proper directory, see instructions [here](https://github.com/wbthomason/packer.nvim#quickstart).
4. create and or navigate to the configuration directory
    - ### windows
        - `cd ~/appdata/local`
    - ### linux
        - `mkdir -p ~/.config && cd ~/.config`
5. git clone this repository and enter the new directory
    - ### https
        - `git clone https://github.com/ninbura/nvim`
    - ### ssh
        - `git clone git@github.com:ninbura/nvim.git`
        - `git config user.name "ninbura"`
        - `git config user.email "gabriel@ninbura.com"`
    - ### both
        - `cd nvim`
6. open neovim in said directory
    - `nvim .`
7. ignore errors and run the following vim command
    - `:PackerSync`
8. quit 💃
    - `:q!`
# setting up as additional configuration
### windows
- `cd ~/appdata/local`
- `rename-item nvim ninvim`
    - persist
        - `[System.Environment]::SetEnvironmentVariable('NVIM_APPNAME', 'ninvim', 'Machine')`
        - `$env:NVIM_APPNAME = [System.Environment]::GetEnvironmentVariable("NVIM_APPNAME", "Machine")`
    - ephemeral
        - `$env:NVIM_APPNAME = ninvim`
