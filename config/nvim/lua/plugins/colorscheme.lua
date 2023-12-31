-- main colorscheme --
return {
  "EdenEast/nightfox.nvim",
  priority = 1000,

  config = function()

    -- Configuration main colorscheme
    require("nightfox").setup({
      options = {
        transparent = false
      }
    })

    -- set vim colorscheme
    vim.cmd.colorscheme "nordfox"

    -- set lualine colorscheme
    require('lualine').setup {
      options = {
        theme = 'nordfox',
      }
    }

  end,
}

