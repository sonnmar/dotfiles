-- main colorscheme --
return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()

    -- colorscheme options
    require('nightfox').setup({
      options = {
        styles = {
          comments = "italic",
        }
      }
    })

    -- set vim colorscheme
    vim.cmd([[colorscheme nordfox]])

    -- set lualine colorscheme
    require('lualine').setup {
      options = {
        theme = 'nordfox',
      }
    }

  end,
}

