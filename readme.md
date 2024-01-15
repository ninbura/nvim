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
          sudo curl -LO https://github.com/neovim/neovim/releases/tag/nightly/download/nvim.appimage
          sudo chmod u+x nvim.appimage
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
    - ### https
        - ```powershell
          git clone https://github.com/ninbura/nvim
          ```
    - ### ssh (applicable to just me 😈)
        - ```powershell
          git clone git@github.com:ninbura/nvim.git
          cd nvim
          git config user.name "ninbura"
          git config user.email "gabriel@ninbura.com"
          ```
5. open neovim, wait for lazy to install plugins, & quit
    - `nvim`
    - wait for lazy to install plugins
    - `:q` (may have to do this twice because of lazy window)
# setup as an additional configuration
### windows
1. rename nvim directory after cloning it
    - If you have an existing nvim configuration folder; clone this repo into a different directory, rename the cloned directory, and then move the directory to `~/appdata/local`.
    - ```powershell
      rename-item -path ~/appdata/local/nvim -newname ninvim
      ```
3. create `APP_NAME` environment variable
    - persistent
        - ```powershell
          [System.Environment]::SetEnvironmentVariable('NVIM_APPNAME', 'ninvim', 'Machine')
          $env:NVIM_APPNAME = [System.Environment]::GetEnvironmentVariable("NVIM_APPNAME", "Machine")
          ```
    - ephemeral
        - ```powershell
          $env:NVIM_APPNAME = ninvim
          ```
4. open neovim, wait for lazy to install plugins, & quit
    - `nvim`
    - wait for lazy to install plugins
    - `:q` (may have to do this twice because of lazy window)
### linux (under construction 🚧)
