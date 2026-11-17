# Table of Contents
- [macOS Setup](#macos-setup)
- [Ubuntu Setup](#ubuntu-setup)
- [Omarchy Setup](#omarchy-setup)
- [Windows Setup](#windows-setup)
- [Changing Configurations](#changing-configurations)
- [Update/Restore Configuration](#updaterestore-configuration)

# macOS Setup
### notes
- Requires Neovim 0.12 or newer.
- Neovim's config directory
    - ```Zsh
      ~/.config/nvim
      ```
- Neovim's data directory
    - ```Zsh
      ~/.local/share/nvim
      ```
### steps
1. install Homebrew via [these insructions](https://docs.brew.sh/Installation)
2. #### create user config directory
    - ```Zsh
      mkdir ~/.config
      ```
3. #### install Neovim & configuration dependencies
    - ```Zsh
      brew install neovim ripgrep nvm go tree-sitter-cli
      ```
4. #### configure nvm
    - add nvm to `~/.zprofile` (skipped if it's already there) & load it into the current session
        - ```Zsh
          mkdir -p ~/.nvm

          nvm_init='export NVM_DIR="$HOME/.nvm"
          [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
          [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"'

          grep -qF '/opt/homebrew/opt/nvm/nvm.sh' ~/.zprofile 2>/dev/null || printf '\n%s\n' "$nvm_init" >> ~/.zprofile
          eval "$nvm_init"
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
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim
              ```
        - for me !!!
            - ```Zsh
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
    - as an additional configuration
        - see [Changing Configurations](#changing-configurations)
        - https
            - ```Zsh
              git clone https://github.com/ninbura/nvim ~/.config/ninvim
              ```
        - ssh
            - ```Zsh
              git clone git@github.com:ninbura/nvim.git ~/.config/ninvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
6. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```Zsh
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```Zsh
      :qa
      ```
# Ubuntu Setup
### notes
- Requires Neovim 0.12 or newer.
- These instructions are structured around Ubuntu, they will vary depending on your choice of Linux distribution.
- Neovim's config directory
    - ```Bash
      ~/.config/nvim
      ```
- Neovim's data directory
    - ```Bash
      ~/.local/share/nvim
      ```
### steps
1. #### create user config directory
    - ```Bash
      mkdir ~/.config
      ```
2. #### install Neovim & configuration dependencies
    - ```Bash
      sudo apt install git curl llvm clang zip fuse ripgrep -y
      ```
    - Go (builds the `sqls` SQL language server; apt's version is too old)
        - ```Bash
          sudo snap install go --classic
          ```
    - tree-sitter CLI (builds syntax highlighting parsers; apt's version is too old)
        - ```Bash
          arch=$(uname -m)

          if [ "$arch" = "x86_64" ]; then
              ts_arch=x64
          elif [ "$arch" = "aarch64" ] || [ "$arch" = "arm64" ]; then
              ts_arch=arm64
          else
              echo "Unsupported architecture: $arch"
              exit 1
          fi

          curl -Lo /tmp/tree-sitter.gz "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-$ts_arch.gz"
          gunzip -f /tmp/tree-sitter.gz
          sudo install -m 755 /tmp/tree-sitter /usr/local/bin/tree-sitter
          ```
3. #### install or update to the latest version of Neovim
    1. run the following commands to pull the latest stable Neovim binary
        - ```Bash
          arch=$(uname -m)
            
          if [ "$arch" = "x86_64" ]; then
              url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
              file=~/nvim-linux-x86_64.tar.gz
              echo "Detected architecture: $arch (x86_64) — using $url"
          elif [ "$arch" = "aarch64" ] || [ "$arch" = "arm64" ]; then
              url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz"
              file=~/nvim-linux-arm64.tar.gz
              echo "Detected architecture: $arch (ARM64) — using $url"
          else
              echo "Unsupported architecture: $arch"
              exit 1
          fi
            
          curl -Lo "$file" "$url"
          sudo rm -rf /opt/nvim
          sudo tar -C /opt -xzf "$file" --one-top-level=nvim --strip-components=1
          ```
    2. add the binary to your `PATH` in `~/.profile` (skipped if it's already there) & in the current session
        - ```Bash
          path_line='export PATH="/opt/nvim/bin:$PATH"'

          grep -qxF "$path_line" ~/.profile 2>/dev/null || echo "$path_line" >> ~/.profile
          eval "$path_line"
          ```
        - Terminal windows you open later get this once you log out and back in.
        - Bash skips `~/.profile` when `~/.bash_profile` or `~/.bash_login` exists, which is common on servers you SSH into. If you have either file, put the line there instead.
4. #### install nvm
    - install **nvm** via [these instructions](https://github.com/nvm-sh/nvm#installing-and-updating)
    - load nvm into the current session (the installer has already added it to `~/.bashrc` for future sessions)
        - ```Bash
          export NVM_DIR="$HOME/.nvm"
          [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
          ```
5. #### configure nvm
    - ```Bash
      nvm install --lts
      nvm use --lts
      ```
6. #### git clone this repository into the relevant location
    - as the primary configuration
        - https
            - ```Bash
              git clone https://github.com/ninbura/nvim ~/.config/nvim
              ```
        - ssh
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim
              ```
        - for me !!!
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
    - as an additional configuration
        - see [Changing Configurations](#changing-configurations)
        - https
            - ```Bash
              git clone https://github.com/ninbura/nvim ~/.config/ninvim
              ```
        - ssh
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/ninvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
7. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```Bash
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```Bash
      :qa
      ```
# Omarchy Setup
### notes
- Requires Neovim 0.12 or newer.
- [Omarchy](https://omarchy.org) is Arch Linux based and already ships most of what this config needs: Neovim (latest, via `pacman`), `git`, `curl`, `zip`, `ripgrep`, `fd`, `gcc`, the tree-sitter CLI, and Node.js + npm (managed by `mise`, so `nvm` isn't needed).
- Omarchy also ships its own Neovim config (LazyVim with Omarchy theme integration) in `~/.config/nvim`, which has to be moved out of the way before cloning.
- Neovim's config directory
    - ```Bash
      ~/.config/nvim
      ```
- Neovim's data directory
    - ```Bash
      ~/.local/share/nvim
      ```
### steps
1. #### install the remaining dependencies
    - ```Bash
      omarchy pkg add clang llvm go
      ```
2. #### move Omarchy's default Neovim config aside
    - ```Bash
      mv ~/.config/nvim ~/.config/nvim.omarchy-default.bak
      ```
    - optionally clear the default config's plugin data too, so Lazy starts clean
        - ```Bash
          mv ~/.local/share/nvim ~/.local/share/nvim.omarchy-default.bak
          ```
3. #### git clone this repository into the relevant location
    - as the primary configuration
        - https
            - ```Bash
              git clone https://github.com/ninbura/nvim ~/.config/nvim
              ```
        - ssh
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim
              ```
        - for me !!!
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/nvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
    - as an additional configuration
        - see [Changing Configurations](#changing-configurations)
        - https
            - ```Bash
              git clone https://github.com/ninbura/nvim ~/.config/ninvim
              ```
        - ssh
            - ```Bash
              git clone git@github.com:ninbura/nvim.git ~/.config/ninvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
4. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```Bash
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```Bash
      :qa
      ```
# Windows Setup
### notes
- Requires Neovim 0.12 or newer.
- Neovim's config directory
    - ```Bash
      ~/AppData/Local/nvim
      ```
- Neovim's data directory
    - ```Bash
      ~/AppData/Local/nvim-data
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
    1. install dependencies     
        - Pick one of the following Visual Studio installs, note that professional is paid & community is free.
            - ```PowerShell
              winget install Microsoft.VisualStudio.Professional --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
              ```
            - ```PowerShell
              winget install Microsoft.VisualStudio.Community --override "--wait --quiet --add ProductLang En-us --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
              ```
        - ```PowerShell
          winget install Git.Git Neovim.Neovim.Nightly LLVM.LLVM CoreyButler.NVMforwindows BurntSushi.ripgrep.GNU GoLang.Go tree-sitter.tree-sitter-cli --accept-package-agreements --accept-source-agreements
          ```
        - ```PowerShell
          $relevantDirectories = @("C:\Program Files\LLVM\bin")
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
    2. restart your terminal session and then run the following commands
        - ```powershell
          nvm install lts
          nvm use lts
          ```
3. #### git clone this repository into the relevant location
    - ##### as the primary configuration
        - https
            - ```PowerShell
              git clone https://github.com/ninbura/nvim $HOME/AppData/Local/nvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git $HOME/AppData/Local/nvim
              ```
        - for me !!!
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git $HOME/AppData/Local/nvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
    - ##### as an additional configuration
        - see [Changing Configurations](#changing-configurations)
        - https
            - ```PowerShell
              git clone https://github.com/ninbura/nvim $HOME/AppData/Local/ninvim
              ```
        - ssh
            - ```PowerShell
              git clone git@github.com:ninbura/nvim.git $HOME/AppData/Local/ninvim --config user.name=ninbura --config user.email="58058942+ninbura@users.noreply.github.com"
              ```
4. #### Open neovim, wait for lazy to install plugins, & quit.
    - ```PowerShell
      nvim
      ```
    - allow Lazy time to install plugins
    - allow Treesitter time to install parsers
    - ```
      :qa
      ```
# Changing Configurations
- ### notes
    - To change configurations on the fly, simply rename you your nvim configuration folder & set the `NVIM_APPNAME` environment variable accordingly.
    - If you followed [as an additional configuration](#as-an-additional-configuration) under [git clone this repository](#git-clone-this-repository) in the setup instructions; you cloned the repository into a folder named `ninvim` instead of `nvim`.
- ### setting the `NVIM_APPNAME` environment variable
    - #### macOS & linux
        - ephemeral (current session only)
            - ```bash
              export NVIM_APPNAME=ninvim
              ```
        - persistent (adds it to your profile, skipped if it's already there, & applies it to the current session)
            - macOS
                - ```Zsh
                  appname_line='export NVIM_APPNAME=ninvim'

                  grep -qxF "$appname_line" ~/.zprofile 2>/dev/null || echo "$appname_line" >> ~/.zprofile
                  eval "$appname_line"
                  ```
            - Linux
                - ```Bash
                  appname_line='export NVIM_APPNAME=ninvim'

                  grep -qxF "$appname_line" ~/.profile 2>/dev/null || echo "$appname_line" >> ~/.profile
                  eval "$appname_line"
                  ```
    - #### Windows
        - ephemeral
            - ```PowerShell
              $env:NVIM_APPNAME = "ninvim"
              ```
        - persistent 
            - ```PowerShell
              # persistent
              $nvimAppName = "ninvim"
              
              [System.Environment]::SetEnvironmentVariable("NVIM_APPNAME", $nvimAppName, "Machine")
              $env:NVIM_APPNAME = $nvimAppName
              ```
# Update/Restore Configuration
- ### notes
    - sometimes after updating you'll have cached configuration files that break plugins and such
    - restore = deleting the data folder
    - restoring will wipe out your undo changes cached by undotree
- ### macOS & Linux
    - #### update
        - ```zsh
          git -C ~/.config/nvim pull
          ```
    - #### restore
        - ```zsh
          rm -rf ~/.local/share/nvim
          ```
- ### Windows
    - #### update
        - ```PowerShell
          git -C $HOME/AppData/Local/nvim pull
          ```
    - #### restore
        - ```PowerShell
          Remove-Item -Path ~/AppData/Local/nvim-data -Recurse -Force
          ```
