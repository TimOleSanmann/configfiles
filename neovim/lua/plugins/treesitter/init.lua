return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require'nvim-treesitter.configs'.setup{
	sync_install = false,
	auto_install = true,
	ensure_installed = {
	  "lua",
	  "bash",
	  -- "dapl_repl",
	  "dockerfile",
	  "html",
	  "markdown",
	  "markdown_inline",
	  "org",
	  "query",
	  "regex",
	  "latex",
	  "vim",
	  "vimdoc",
	  "yaml",
	},
	highlight = {
	  enable = true,
	  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	  -- Using this option may slow down your editor, and you may see some duplicate highlights.
	  -- Instead of true it can also be a list of languages
	  additional_vim_regex_highlighting = false,
	},
	indent = {
	  enable = true
	}
      }
    end,
  },
}
