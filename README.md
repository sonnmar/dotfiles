# dotfiles

In this repository are my personal dotfiles to use on my Mac- and Linux systems. To install the files I clone the repository to a Project-Folder and symlink the folders to my home-directory.

To do my work in the terminal I use:

- [Alacritty](https://alacritty.org/)
- [tmux](https://github.com/tmux/tmux/)
- [zsh](https://www.zsh.org/)
- [neovim](https://neovim.io/)

To make use of the plugins I need the following plugin-managers:

- [tpm for tmux](https://github.com/tmux-plugins/tpm/)
- [zap for zsh](https://github.com/zap-zsh/zap/)
- [lazy for neovim](https://github.com/folke/lazy.nvim/)

For the fancy icons in neovim I make use of [Hack Nerd Font](https://www.nerdfonts.com/), I externally installed.

As a new starting point of my Neovim configuration I use [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). My old configuration where miles away from this. Thank you for your excellent work, it helps me a lot. In the nvim folder I stored a basic config-file for vim and nvim without plugins.

I installed the following external tools:

- [fzf](https://github.com/junegunn/fzf/)
- [bat](https://github.com/sharkdp/bat)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

To install the tools use your packet-manager of choice.

In the alacritty config file I sourced a file "theme.toml" that I symlinked to an external file with settings for a colorscheme, for example in the repository of a nvim colorscheme.
