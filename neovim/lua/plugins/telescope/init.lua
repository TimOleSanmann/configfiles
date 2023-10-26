return {
  'nvim-telescope/telescope.nvim', 
  lazy = false,
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
  },
}
