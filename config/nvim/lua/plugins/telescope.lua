-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "BurntSushi/ripgrep"
  },
  keys =  {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find file" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope find buffer" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope file grep" },
  }
}
