-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0


-- Map Leader
vim.g.mapleader = ' '

--  configuration for lazy.vim (https://github.com/folke/lazy.nvim)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- read all files in ~/.config/nvim/lua/plugins
-- ToDo: {{ lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json" }}
require("lazy").setup(
  {{ import = "plugins" }}
)

