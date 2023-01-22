# dotfiles

In this repository are my personal dotfiles to use on my Mac. To install the files I clone the repository to a Project-Folder an symlink the folders to my home-directory.

For neovim and tmux I need plugin-managers, [plug.vim](https://github.com/junegunn/vim-plug) for neovim and [tmux-plugin/tpm](https://github.com/tmux-plugins/tpm) for tmux. 

```shell
curl -flo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```

For the fancy icons in neovim I make use of [Hack Nerd Font](https://www.nerdfonts.com/), I externally installed.
