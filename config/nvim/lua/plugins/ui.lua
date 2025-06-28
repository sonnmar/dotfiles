return {
  -- add nightfox
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
          },
        },
      })
    end,
  },

  -- Configure LazyVim to load nordfox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
    },
  },

  -- show bufferline always?
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = false,
      },
    },
  },

  -- rearrange lualine sections and symbols
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_y = {
          { "fileformat", separator = " ", symbols = { unix = "", dos = "", mac = "" } },
          { "encoding", show_bomb = false },
        },
        lualine_z = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
      },
    },
  },
}
