# AstroNvim 

**NOTE:** This is for AstroNvim v4+

the configuration based on a template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

  ```shell
  # backup your old configurations
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  mv ~/.local/state/nvim ~/.local/state/nvim.bak
  mv ~/.cache/nvim ~/.cache/nvim.bak
  # or just delete them
  rm ~/.config/nvim ~/.local/{share, state}/nvim ~/.cache/nvim
  ```

#### Install the dependencies

  ```shell
  # ripgrep
  apt install ripgrep

  # lazygit
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/

  # bottom
  rustup update stable
  cargo install bottom
  ```

#### Clone the repository

  ```shell
  git clone astronvim_config ~/.config/nvim
  ```

#### Start Neovim

```shell
nvim
```
