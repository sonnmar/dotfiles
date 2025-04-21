-- au group for filetype specific settings
local id_filetype = vim.api.nvim_create_augroup("CustomFiletype", {
  clear = true,
})

-- different indention for shell scripts
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "zsh" },
  callback = function()
    vim.opt.shiftwidth = 4
  end,
  group = id_filetype,
})

return {
  -- autoformat
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
      },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "4", "-ci" },
      },
    },
  },
}
