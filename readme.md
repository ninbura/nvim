# preface
If you're on Windows, I'm assuming you're using PowerShell 7. If you're not using PowerShell 7, I will cry.
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
          winget install git.git llvm.llvm coreybutler.nvmforwindows burntsushi.ripgrep.gnu --accept-package-agreements --accept-source-agreements
          ```
        - ```powershell
          git clone https://github.com/ninbura/diff.git c:/users/$env:username/documents/diff
          ``` 

        - ```powershell
          $relevantDirectories = @("C:\Program Files\LLVM\bin", "C:\Users\$env:username\Documents\diff")
          $machineAndUserPath = ([Environment]::GetEnvironmentVariable("Path"))

          foreach($directory in $relevantDirectories) {
              if($machineAndUserPath -notmatch $directory.replace("\", "\\")) {
                  $splitPath = [Environment]::GetEnvironmentVariable("Path", "Machine").Split(";")
                  $newPath = ($splitPath + $directory) -Join ";"
                  [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
                  $env:Path = [System.Environment]::GetEnvironmentVariable("Path")
              }
          }
          ```
        - ```powershell
          nvm install lts
          nvm use lts
          ```
    - #### linux
        - ```bash
          sudo apt install curl llvm clang zip fuse ripgrep -y
          ```
        - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
        - ```bash
          source ~/.bashrc
          ```
        - ```bash
          nvm install lts/*
          nvm use lts/*
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
            
          $machineAndUserPath = ([Environment]::GetEnvironmentVariable("Path"))
          $neovimDirectory = "C:\Users\$env:username\Documents\nvim-win64\bin"
            
          if($machineAndUserPath -notmatch $neovimDirectory.replace("\", "\\")) {
              $splitPath = [Environment]::GetEnvironmentVariable("Path", "Machine").Split(";")
              $newPath = ($splitPath + $neovimDirectory) -Join ";"
              [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
              $env:Path = [System.Environment]::GetEnvironmentVariable("Path")
          }

          if(test-path $archivePath) { Remove-Item -Path $archivePath -Force }
          ```
    - #### linux
        - ```bash
          wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
          chmod u+x nvim.appimage
          sudo mv nvim.appimage /usr/local/bin/nvim
          ```
3. ### create and or navigate to the neovim configuration directory
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
          git clone git@github.com:ninbura/nvim.git --config user.name=ninbura --config user.email=gabriel@ninbura.com
          ```
    - #### as an additional configuration
        - ```powershell
          # https
          git clone https://github.com/ninbura/nvim ninvim
          ```
        - ```powershell
          # ssh
          git clone git@github.com:ninbura/nvim.git ninvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
          ```
        - see [changing configurations](#changing-configurations)
5. ### open neovim, wait for lazy to install plugins, & quit
    - `nvim`
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - `:q` (may have to do this twice because of lazy window)
6. ### intialize github copilot & rosyln
    - Totally optional, only applicable if you pay for GitHub Copilot, or you use [roslyn.nvim](https://github.com/jmederosalvarado/roslyn.nvim).
    - #### copilot
        - ```
          :Copilot setup
          ```
    - #### roslyn
        - See [here](https://github.com/jmederosalvarado/roslyn.nvim/issues/4#issuecomment-1859198818) if you're trying to initialize the Roslyn server with dotnet != 7.
        - ```
          :CSInstallRoslyn
          ```
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
