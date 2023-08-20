-- main colorscheme --
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()

    -- Configuration main colorscheme
    require("catppuccin").setup({
      flavour = "frappe", -- latte, frappe, macchiato, mocha
    })

    -- set vim colorscheme
    vim.cmd.colorscheme "catppuccin"

    -- set lualine colorscheme
    -- local custom_cat = require'lualine.themes.catppuccin'
    -- custom_cat.normal.c.bg = '#112233'
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
      }
    }

  end,
}

