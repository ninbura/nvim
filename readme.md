# summary
My neovim configuration and how to utilize it.
# steps to utilize
1. install dependencies
    - ### windows
        - ```
          winget install jazzdelightsme.WingetPathUpdater # requires elevated terminal
          ```
        - ```powershell
          # professional license (paid)
          winget install microsoft.visualstudio.2022.professional --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
        - ```powershell
          # community license (free)
          winget install microsoft.visualstudio.2022.community --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
        - `winget install llvm.llvm`
        - `winget install coreybutler.nvmforwindows`
        - `winget install burntsushi.ripgrep.gnu`
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
        - `sudo apt install ripgrep`
        - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
        - `source ~/.bashrc`
    - ### both
        - `nvm install latest`
        - `nvm use latest`
2. install neovim nightly
    - ### windows
        - `winget install neovim.neovim.nightly`
    - ### linux
        - ```bash
          curl -LO https://github.com/neovim/neovim/releases/tag/nightly/download/nvim.appimage`
          chmod u+x nvim.appimage
          sudo mv nvim.appimage /usr/local/bin/nvim
          ```
3. create and or navigate to the configuration directory
    - ### windows
        - `cd ~/appdata/local`
    - ### linux
        - `mkdir -p ~/.config && cd ~/.config`
4. git clone this repository and enter the new directory
    - ### https
        - `git clone https://github.com/ninbura/nvim`
    - ### ssh
        - `git clone git@github.com:ninbura/nvim.git`
        - `git config user.name "ninbura"`
        - `git config user.email "gabriel@ninbura.com"`
5. open neovim, wait for lazy to install plugins, & quit
    - `nvim`
    - wait for lazy to install plugins
    - `:q` (may have to do this twice because of lazy window)
# setting up as additional configuration
### windows
1. rename nvim directory
    - `rename-item -path ~/appdata/local/nvim -newname ninvim`
2. create `APP_NAME` environment variable
    - persist
        - `[System.Environment]::SetEnvironmentVariable('NVIM_APPNAME', 'ninvim', 'Machine')`
        - `$env:NVIM_APPNAME = [System.Environment]::GetEnvironmentVariable("NVIM_APPNAME", "Machine")`
    - ephemeral
        - `$env:NVIM_APPNAME = ninvim`
3. open neovim, wait for lazy to install plugins, & quit
    - `nvim`
    - wait for lazy to install plugins
    - `:q` (may have to do this twice because of lazy window)
### linux (under construction 🚧)
