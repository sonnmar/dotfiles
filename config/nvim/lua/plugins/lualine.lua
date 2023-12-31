-- Statusline --
return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup {
      options = {
        icons_enable = true,
        always_divide_middle = true,
        component_separators = { left = "", right = ""},
        section_separators = {left = "", right = ""},        
      }
    }
  end,
}

