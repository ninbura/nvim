# macOS setup
### notes
- Neovim's config directory
    - ```bash
      ~/.config/nvim
      ```
- Neovim's data directory
    - ```bash
      ~/.local/share/nvim-data
      ```
### steps
1. install Homebrew via [these insructions](https://docs.brew.sh/Installation)

# Linux setup
### notes
- Neovim's config directory
    - ```bash
      ~/.config/nvim
      ```
- Neovim's data directory
    - ```bash
      ~/.local/share/nvim-data
      ```
- These instructions are structured around Ubuntu, they will vary depending on your choice of Linux distrobution.
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
2. #### create the Neovim config directory's parent directory
    - ```bash
      mkdir -p ~/.config
      ```
3. #### git clone this repository into the relevant location
    - ##### as the primary configuration
        - https
            - ```bash
              git clone https://github.com/ninbura/nvim ~/appdata/local/nvim
              ```
        - ssh
            - ```bash
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/nvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
    - ##### as an additional configuration
        - see [changing configurations](#changing-configurations)
        - https
            - ```bash
              git clone https://github.com/ninbura/nvim ~/appdata/local/ninvim
              ```
        - ssh
            - ```bash
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/ninvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
4. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```Bash
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```Bash
      :q
      ```
    - note that you may have to run `:q` twice due to lazy's popup window
5. #### intialize github copilot & rosyln if desired
    - see [here](https://github.com/jmederosalvarado/roslyn.nvim/issues/4#issuecomment-1859198818) if you're trying to initialize the Roslyn server with dotnet != 7
    - run the following commands in Neovim
    - ```
      :Copilot setup
      ```
    - ```
      :CSInstallRoslyn
      ```
# Windows Setup
### notes
- Neovim's config directory
    - ```bash
      ~/appdata/local/nvim
      ```
- Neovim's data directory
    - ```bash
      ~/appdata/local/nvim-data
      ```
- If you're not using PowerShell 7, I will cry.
    - ```PowerShell
      winget install microsoft.powershell
      ```
### steps
1. #### enable running PowerShell scripts
    - requires elevated shell
        - ```PowerShell
          Set-ExecutionPolicy RemoteSigned
          ```
2. #### install Neovim & configuration dependencies
    - requires elevated shell
        - ```PowerShell
          winget install jazzdelightsme.WingetPathUpdater
          ```
    - Pick one of the following Visual Studio installs, note that professional is paid & community is free.
        - ```PowerShell
          winget install Microsoft.VisualStudio.2022.Professional --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
        - ```PowerShell
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
3. #### git clone this repository into the relevant location
    - ##### as the primary configuration
        - https
            - ```PowerShell
              git clone https://github.com/ninbura/nvim ~/appdata/local/nvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/nvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
    - ##### as an additional configuration
        - see [changing configurations](#changing-configurations)
        - https
            - ```PowerShell
              git clone https://github.com/ninbura/nvim ~/appdata/local/ninvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git ~/appdata/local/ninvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
4. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```PowerShell
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```
      :q
      ```
    - note that you may have to run `:q` twice due to lazy's popup window
5. #### intialize github copilot & rosyln if desired
    - see [here](https://github.com/jmederosalvarado/roslyn.nvim/issues/4#issuecomment-1859198818) if you're trying to initialize the Roslyn server with dotnet != 7
    - run the following commands in Neovim
    - ```
      :Copilot setup
      ```
    - ```
      :CSInstallRoslyn
      ```
# changing configurations
- ### notes
    - To change configurations on the fly, simply rename you your nvim configuration folder & set the `NVIM_APPNAME` environment variable accordingly.
    - If you followed [as an additional configuration](#as-an-additional-configuration) under [git clone this repository](#git-clone-this-repository) in the setup instructions; you cloned the repository into a folder named `ninvim` instead of `nvim`.
- ### setting the `NVIM_APPNAME` environment variable
    - #### macOS & linux
        - Running the following command in your terminal will change your Neovim configuration for your current session (ephemeral). Adding the following command to your profile will change your configuration for all sessions at login (persistent).
        - ```bash
          export NVIM_APPNAME=ninvim
          ```
        - profile locations
            - macOS
                - ```Zsh
                  ~/.zprofile
                  ```
            - Linux
                - ```Bash
                  ~/.profile
                  ``` 
    - #### windows
        - persistent 
            - ```powershell
              # persistent
              $nvimAppName = ninvim
              
              [System.Environment]::SetEnvironmentVariable("NVIM_APPNAME", $nvimAppName, "Machine")
              $env:NVIM_APPNAME = $nvimAppName
              ```
        - ephemeral
            - ```powershell
              $env:NVIM_APPNAME = ninvim
              ```
