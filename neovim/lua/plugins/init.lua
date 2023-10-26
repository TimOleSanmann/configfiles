return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'tpope/vim-commentary'
  },
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup {
	enabled = true,
	message_template = '<author> • <date> • <summary> • <sha>'
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  }
}
