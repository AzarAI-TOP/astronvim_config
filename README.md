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

#### Install the dependencies (only for Debians....)

```shell
# ripgrep
apt install ripgrep

# lazygit
conda install -c conda-forge lazygit

# bottom
apt install btm

# node
apt install nodejs npm

# gdu
apt install gdu

# luarocks
apt install luarocks
```

#### Clone the repository

```shell
git clone git@github.com:AzarAI-TOP/astronvim_config.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
