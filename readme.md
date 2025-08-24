# table of contents
- [macOS setup](#macOS-setup)
- [Linux setup](#Linux-setup)
- [Windows setup](#Windows-setup)
- [changing configurations](#changing-configurations)

# macOS setup
### notes
- Neovim's config directory
    - ```Zsh
      ~/.config/nvim
      ```
- Neovim's data directory
    - ```Zsh
      ~/.local/share/nvim-data
      ```
### steps
1. install Homebrew via [these insructions](https://docs.brew.sh/Installation)
2. #### create user config directory
    - ```Zsh
      mkdir ~/.config
      ```
3. #### install Neovim & configuration dependencies
    - ```Zsh
      brew install neovim ripgrep nvm
      ```
4. #### configure nvm
    - ```Zsh
      mkdir ~/.nvm && touch ~/.zprofile
      ```
    - add the following entries to `~/.zprofile`
        - ```Zsh
          export NVM_DIR="$HOME/.nvm"
          [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
          [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
          ```
    - ```Zsh
      source ~/.zprofile
      ```
    - ```Zsh
      nvm install --lts
      nvm use --lts
      ```
5. #### git clone this repository into the relevant location
    - as the primary configuration
        - https
            - ```Zsh
              git clone https://github.com/ninbura/nvim ~/.config/nvim
              ```
        - ssh
            - ```Zsh
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
    - as an additional configuration
        - see [changing configurations](#changing-configurations)
        - https
            - ```Zsh
              git clone https://github.com/ninbura/nvim ~/.config/ninvim
              ```
        - ssh
            - ```Zsh
              git clone git@github.com:ninbura/nvim.git ~/.config/ninvim --config user.name=ninbura --config user.email=gabriel@ninbura.com
              ```
6. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```Zsh
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```Zsh
      :q
      ```
7. #### intialize github copilot desired
    - run the following command in Neovim
    - ```
      :Copilot setup
      ``` 
# Linux setup
### notes
- Neovim's config directory
    - ```Bash
      ~/.config/nvim
      ```
- Neovim's data directory
    - ```Bash
      ~/.local/share/nvim
      ```
- These instructions are structured around Ubuntu, they will vary depending on your choice of Linux distribution.
### steps
1. #### create user config directory
    - ```Bash
      mkdir ~/.config
      ```
3. #### install Neovim & configuration dependencies
    - ```Bash
      sudo apt install git curl llvm clang zip fuse ripgrep -y
      ```
3. #### install or update to the latest version of Neovim
    1. run one of the following commands to pull down the latest version of neovim
        - Arm64
            - ```Bash
              curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz
              sudo rm -rf /opt/nvim
              sudo tar -C /opt -xzf nvim-linux-arm64.tar.gz
              ```
       - x86
           - ```Bash
             curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
             sudo rm -rf /opt/nvim
             sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
             ```
    2. add the binary to your path
        - run the following command to open your `~/.profile` for editing
            - ```
              nano ~/.profile
              ```
        - append the following to the bottom of the file
            - ```
              export PATH="/opt/nvim/bin:$PATH"
              ```
        - Hit `ctrl+O` to start the save process, hit `enter` to confirm, and `ctrl+x` to exit.
4. #### install & configure nvm
    - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
    - make sure you add the necessary lines to your `~/.profile` as the instructions state in your terminal after following the above instructions
        - Use nano just like the second half in the last step.
        - ```
          nano ~/.profile
          ```
5. restart your computer
   - You could techincally get away with sourcing your `~/.profile` but I consistently have issues with this... so I restart.
6. configure nvm
    - ```Bash
      nvm install --lts
      nvm use --lts
      ```
7. #### git clone this repository into the relevant location
    - as the primary configuration
        - https
            - ```Bash
              git clone https://github.com/ninbura/nvim ~/.config/nvim
              ```
        - ssh
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
    - as an additional configuration
        - see [changing configurations](#changing-configurations)
        - https
            - ```Bash
              git clone https://github.com/ninbura/nvim ~/.config/ninvim
              ```
        - ssh
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/ninvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
8. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```Bash
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```Bash
      :q
      ```
    - note that you may have to run `:q` twice due to lazy's popup window
9. #### intialize github copilot if desired
    - run the following command while in Neovim
    - ```
      :Copilot setup
      ```
# Windows Setup
### notes
- Neovim's config directory
    - ```Bash
      ~/appdata/local/nvim
      ```
- Neovim's data directory
    - ```Bash
      ~/appdata/local/nvim-data
      ```
- If you're not using PowerShell 7, I will cry.
    - ```PowerShell
      winget install Microsoft.PowerShell
      ```
### steps
1. #### enable running PowerShell scripts
    - ```PowerShell
      sudo Set-ExecutionPolicy RemoteSigned
      ```
2. #### install Neovim & configuration dependencies
    - ```PowerShell
      sudo winget install jazzdelightsme.WingetPathUpdater
      ```
    - Pick one of the following Visual Studio installs, note that professional is paid & community is free.
        - ```PowerShell
          winget install Microsoft.VisualStudio.2022.Professional --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
        - ```PowerShell
          winget install Microsoft.VisualStudio.2022.Community --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
          ```
    - ```PowerShell
      winget install Git.Git Neovim.Neovim LLVM.LLVM CoreyButler.NVMforwindows BurntSushi.ripgrep.GNU --accept-package-agreements --accept-source-agreements
      ```
    - ```PowerShell
      git clone https://github.com/ninbura/diff.git /Users/$env:username/Documents/diff
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
              git clone https://github.com/ninbura/nvim /Users/$env:username/appdata/local/nvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git /Users/$env:username/appdata/local/nvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
    - ##### as an additional configuration
        - see [changing configurations](#changing-configurations)
        - https
            - ```PowerShell
              git clone https://github.com/ninbura/nvim /Users/$env:username/appdata/local/ninvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git /Users/$env:username/appdata/local/ninvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
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
5. #### intialize github copilot if desired
    - run the following command while in Neovim
    - ```
      :Copilot setup
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
    - #### Windows
        - ephemeral
            - ```PowerShell
              $env:NVIM_APPNAME = ninvim
              ```
        - persistent 
            - ```PowerShell
              # persistent
              $nvimAppName = ninvim
              
              [System.Environment]::SetEnvironmentVariable("NVIM_APPNAME", $nvimAppName, "Machine")
              $env:NVIM_APPNAME = $nvimAppName
              ```
