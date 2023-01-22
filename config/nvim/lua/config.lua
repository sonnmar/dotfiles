require('lualine').setup {
  options = {
    icons_enable = true,
    theme = 'nord',
    component_separators = { left = "", right = ""},
    section_separators = {left = "", right = ""},
    disabled_filetypes = {},
    always_divide_middle = true,
  }
}

require('bufferline').setup {
  options = {
  }
}

