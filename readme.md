# preface
If you're on Windows, I'm assuming you are using PowerShell 7. If you are not using PowerShell 7, I will cry.
```powershell
winget install microsoft.powershell
```
# setup
1. ### install dependencies
    - #### windows
        - ```powershell
          # requires elevated shell
          winget install jazzdelightsme.wingetPathUpdater
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
    - #### linux
        - ```bash
          sudo apt install llvm clang zip fuse ripgrep -y
          ```
        - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
        - ```bash
          source ~/.bashrc
          ```
    - #### both
        - ```powershell
          nvm install latest
          nvm use latest
          ```
2. ### install neovim nightly
    - #### windows
        - ```powershell
          # Requires a non-elvated terminal, which is not possible over ssh.
          winget install neovim.neovim.nightly --ignore-security-hash
          ```
        - ```powershell
          # ssh friendly
          $applicationPath = "~/documents/nvim-win64"
          $archivePath = "~/documents/nvim.zip"
            
          if(test-path $applicationPath) {
              remove-item -Path $applicationPath -Recurse -Force
          }
            
          Invoke-WebRequest -Uri https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip -OutFile $archivePath
          Expand-Archive -Path $archivePath -DestinationPath ~/documents
            
          $currentPath = ([Environment]::GetEnvironmentVariable("Path"))
            
          if($currentPath.ToLower() -notmatch "c:\\users\\$env:username\\documents\\nvim-win64\\bin") {
              $splitPath = $CurrentPath.Split(";")
              $newPath = ($splitPath + "c:\users\$env:username\documents\nvim-win64\bin") -Join ";"
              [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
              $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
          }
          ```
    - #### linux
        - ```bash
          curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
          chmod u+x nvim.appimage
          sudo mv nvim.appimage /usr/local/bin/nvim
          ```
3. ### create and or navigate to the configuration directory
    - #### windows
        - ```powershell
          # nvim-data folder in same directory
          cd ~/appdata/local
          ```
    - #### linux
        - ```bash
          # nvim-data folder - ~/.local/share/
          mkdir -p ~/.config && cd ~/.config
          ```
4. ### git clone this repository
    - #### as the primary configuration
        - ```powershell
          # https
          git clone https://github.com/ninbura/nvim
          ```
        - ```powershell
          # ssh
          git clone git@github.com:ninbura/nvim.git --config "user.name=ninbura user.email=gabriel@ninbura.com"
          ```
    - #### as an additional configuration
        - ```powershell
          # https
          git clone https://github.com/ninbura/nvim ninvim
          ```
        - ```powershell
          # ssh
          git clone git@github.com:ninbura/nvim.git ninvim --config "user.name=ninbura user.email=gabriel@ninbura.com"
          ```
        - see [changing configurations](#changing-configurations)
5. ### open neovim, wait for lazy to install plugins, & quit
    - `nvim`
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - `:q` (may have to do this twice because of lazy window)
# changing configurations
- ### preface
    - To change configurations on the fly, simply rename you your nvim configuration folder & set the `NVIM_APPNAME` environment variable accordingly.
    - If you followed [as an additional configuration](#as-an-additional-configuration) under [git clone this repository](#git-clone-this-repository) in the setup instructions; you cloned the repository into a folder named `ninvim` instead of `nvim`.
- ### setting the `NVIM_APPNAME` environment variable
    - #### windows
        - ```powershell
          # persistent
          $nvimAppName = ninvim
          
          [System.Environment]::SetEnvironmentVariable("NVIM_APPNAME", $nvimAppName, "Machine")
          $env:NVIM_APPNAME = $nvimAppName
          ```
        - ```powershell
          # ephemeral
          $env:NVIM_APPNAME = ninvim
          ```
    - #### linux
        - ```bash
          # Changes configuration for current session, add to ~/.profile for persistence.
          export NVIM_APPNAME=ninvim
          ``` 
