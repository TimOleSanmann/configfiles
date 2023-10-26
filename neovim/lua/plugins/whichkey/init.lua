return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("which-key").setup()
      require("which-key").register(
      {
	b = {
	  name = "git blame",
	  c = { "<cmd>:GitBlameCopySHA<CR>", "Copy commit SHA" },
	  o = { "<cmd>:GitBlameOpenCommitURL<CR>", "Open commit URL" },
	  t = { "<cmd>:GitBlameToggle<CR>", "Toggle git blame" },
	},
      }, 
      {prefix = "<leader>"}
      )
    end,
  }
}
