# summary
My neovim configuration and how to utilize it.
# setup
1. install dependencies
    - ### windows
        - ```powershell
          # requires elevated shell
          winget install jazzdelightsme.WingetPathUpdater
          ``` 
        - ```powershell
          # professional license (paid)
          winget install microsoft.visualstudio.2022.professional --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
        - ```powershell
          # community license (free)
          winget install microsoft.visualstudio.2022.community --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
        - ```powershell
          winget install llvm.llvm coreybutler.nvmforwindows burntsushi.ripgrep.gnu --accept-package-agreements --accept-source-agreements
          ```

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
        - ```bash
          sudo apt install llvm clang zip fuse ripgrep -y
          ```
        - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
        - ```bash
          source ~/.bashrc
          ```
    - ### both
        - ```powershell
          nvm install latest
          nvm use latest
          ```
2. install neovim nightly
    - ### windows
        - ```powershell
          winget install neovim.neovim.nightly
          ```
    - ### linux
        - ```bash
          curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
          chmod u+x nvim.appimage
          sudo mv nvim.appimage /usr/local/bin/nvim
          ```
3. create and or navigate to the configuration directory
    - ### windows
        - ```powershell
          # nvim-data folder in same directory
          cd ~/appdata/local
          ```
    - ### linux
        - ```bash
          # nvim-data folder - ~/.local/share/
          mkdir -p ~/.config && cd ~/.config
          ```
4. git clone this repository
    - ### as primary configuration
        - ```powershell
          git clone https://github.com/ninbura/nvim
          ```
        - ```powershell
          git clone git@github.com:ninbura/nvim.git --config name=ninbura email=gabriel@ninbura.com
          ```
    - ### as additional configuration
        - ```powershell
          # https
          git clone https://github.com/ninbura/nvim ninvim
          ```
        - ```powershell
          # ssh
          git clone git@github.com:ninbura/nvim.git ninvim --config name=ninbura email=gabriel@ninbura.com
          ```
5. open neovim, wait for lazy to install plugins, & quit
    - `nvim`
    - wait for lazy to install plugins
    - `:q` (may have to do this twice because of lazy window)
