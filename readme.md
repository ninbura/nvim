# macOS setup
### preface
You'll need to install Homebrew, instructions for how to do so can be found [here](https://docs.brew.sh/Installation).
### steps

# Linux setup
### preface
- Istrunctions here are for Ubuntu, they may vary slightly depending on your distribution.
### steps
1. #### install Neovim & configuration dependencies
    - ```bash
      sudo apt install neovim curl llvm clang zip fuse ripgrep -y
      ```
    - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
    - ```bash
      source ~/.bashrc
      ```
    - ```bash
      nvm install lts/*
      nvm use lts/*
      ```
2. ### create the Neovim config's parent directory
    - ```bash
      mkdir -p ~/.config
      ```
3. ### git clone this repository into the Neovim config's parent directory
    - #### as the primary configuration
        - https
            - ```bash
              git clone https://github.com/ninbura/nvim ~/appdata/local/nvim
              ```
        - ssh
            - ```bash
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/nvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
    - #### as an additional configuration
        - see [changing configurations](#changing-configurations)
        - https
            - ```bash
              git clone https://github.com/ninbura/nvim ~/appdata/local/ninvim
              ```
        - ssh
            - ```bash
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/ninvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
### notes
- Neovim's data folder can be found at the following location.
    - ```bash
      ~/.local/share/nvim-data
      ```
# Windows Setup
### preface
If you're not using PowerShell 7, I will cry.
```PowerShell
winget install microsoft.powershell
```
1. #### install Neovim & configuration dependencies
    - ```PowerShell
      # requires elevated shell
      winget install jazzdelightsme.WingetPathUpdater
      ``` 
    - ```PowerShell
      # professional license (paid)
      winget install Microsoft.VisualStudio.2022.Professional --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
      ```
    - ```PowerShell
      # community license (free)
      winget install Microsoft.VisualStudio.2022.Community --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
      ```
    - ```PowerShell
      winget install Neovim.Neovim Git.Git LLVM.LLVM CoreyButler.NVMforwindows BurntSushi.ripgrep.GNU --accept-package-agreements --accept-source-agreements
      ```
    - ```PowerShell
      git clone https://github.com/ninbura/diff.git c:/users/$env:username/documents/diff
      ``` 
    - ```PowerShell
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
2. ### git clone this repository into the Neovim config's parent directory
    - #### as the primary configuration
        - https
            - ```PowerShell
              git clone https://github.com/ninbura/nvim ~/appdata/local/nvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/nvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
    - #### as an additional configuration
        - see [changing configurations](#changing-configurations)
        - https
            - ```PowerShell
              git clone https://github.com/ninbura/nvim ~/appdata/local/ninvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/ninvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
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
