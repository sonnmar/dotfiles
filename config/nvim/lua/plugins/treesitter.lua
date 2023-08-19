-- Statusline --
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()

    -- treesitter options
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = {  },
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
    }

  end,
}

