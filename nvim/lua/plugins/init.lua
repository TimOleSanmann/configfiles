return {
  { "kchmck/vim-coffee-script" },
  { "digitaltoad/vim-pug" },
  { 'echasnovski/mini.indentscope', version = '*' },
  { 
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup{
	disable_netrw = true,
	diagnostics = {
	  enable = true,
	  show_on_dirs = true
	},
	update_focused_file = {
	  enable = true,
	}
      }
    end,	
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")

      wk.register({
	f = { name = "file" },
	e = {
	  name = "explorer",
	  e = { ":NvimTreeToggle<cr>", "Toggle Tree view" }
	},
	z = { ":Lazy<cr>", "Open Lazygit" },
	w = { name = "window" },
	c = { name = "config" },
	["<leader><leader>"] = { name = "+Hop" },
	["b"] = { name = "+Buffer" },
	["m"] = { name = "+Markdown"},
	["s"] = { name = "+Spell checking"},
	["p"] = { name = "+Session"},
	["d"] = { name = "+Diffview"},
	["l"] = { name = "+LSP"},
	["v"] = { name = "+Vimux"},
	["g"] = { name = "+Git"},
      }, { prefix = "<leader>" })	
    end,
    opts = {
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      sidebar_filetypes = {
	NvimTree = { text = 'File Explorer', align = 'center', },
      },
      icons = {
	-- Configure the base icons on the bufferline.
	-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
	-- Enables / disables diagnostic symbols
	diagnostics = {
	  [vim.diagnostic.severity.ERROR] = {enabled = true},
	  [vim.diagnostic.severity.WARN] = {enabled = true},
	  [vim.diagnostic.severity.INFO] = {enabled = true},
	  [vim.diagnostic.severity.HINT] = {enabled = true},
	},
	gitsigns = {
	  added = {enabled = true, icon = '+'},
	  changed = {enabled = true, icon = '~'},
	  deleted = {enabled = true, icon = '-'},
	},
      }
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function()
      require('gitsigns').setup {
	current_line_blame = true,
	current_line_blame_opts = {
	  delay = 0,
	  ignore_whitespace = true,
	  virt_text_priority = 100,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary> - <abbrev_sha>',
      }
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
	theme = "doom",
	config = {
	  center = {
	    {
	      icon = ' ',
	      icon_hl = 'Title',
	      desc = 'Find file',
	      desc_hl = 'String',
	      key = 'f',
	      key_format = '%s',
	      key_hl = 'Number',
	      action = 'Telescope find_files'
	    },
	    {
	      icon = ' ',
	      icon_hl = 'Title',
	      desc = 'Find Git file',
	      desc_hl = 'String',
	      key = 'g',
	      key_format = '%s',
	      key_hl = 'Number',
	      action = 'Telescope git_files'
	    },
	    {
	      icon = ' ',
	      icon_hl = 'Title',
	      desc = 'Search string',
	      desc_hl = 'String',
	      key = 's',
	      key_format = '%s',
	      key_hl = 'Number',
	      action = 'Telescope live_grep'
	    },
	    {
	      icon = ' ',
	      icon_hl = 'Title',
	      desc = 'Toggle file explorer',
	      desc_hl = 'String',
	      key = 'e',
	      key_format = '%s',
	      key_hl = 'Number',
	      action = 'NvimTreeToggle'
	    },
	    {
	      icon = '󰜫 ',
	      icon_hl = 'Title',
	      desc = 'Lazy',
	      desc_hl = 'String',
	      key = 'z',
	      key_format = '%s',
	      key_hl = 'Number',
	      action = 'Lazy'
	    },
	    {
	      icon = ' ',
	      icon_hl = 'Title',
	      desc = 'Restore session',
	      desc_hl = 'String',
	      key = 'p',
	      key_format = '%s',
	      key_hl = 'Number',
	      action = 'lua require("persistence").load({ last = true })'
	    },
	    {
	      icon = ' ',
	      icon_hl = 'Title',
	      desc = 'Quit',
	      desc_hl = 'String',
	      key = 'q',
	      key_format = '%s',
	      key_hl = 'Number',
	      action = 'quitall'
	    },
	  },
	},
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup {
	ensure_installed = {
	  "html",
	  "javascript",
	  "typescript",
	  "lua",
	  "markdown",
	  "json",
	  "dockerfile"
	},
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
	char = "│",
	tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
	filetypes = {
	  "help",
	  "alpha",
	  "dashboard",
	  "neo-tree",
	  "Trouble",
	  "trouble",
	  "lazy",
	  "mason",
	  "notify",
	  "toggleterm",
	  "lazyterm",
	},
      },
    },
    main = "ibl",
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "tpope/vim-commentary",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "sindrets/diffview.nvim"
  },
  {
    "preservim/vimux"
  },
  {
    "folke/neoconf.nvim",
    init = function()
	require("neoconf").setup({})
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      cmp.setup({
	sources = cmp.config.sources({
	  { name = "buffer" },
	  { name = "path" },
	  { name = "nvim_lsp" },
	  { name = "luasnip" }
	}),
	formatting = {
	  format = function(entry, vim_item)
	    vim_item.menu = ({
	      buffer = "[Buffer]",
	      path = "[Path]",
	      luasnip = "[LuaSnip]",
	      nvim_lsp = "[LSP]",
	    })[entry.source.name]
	    return vim_item
	  end,
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	  ["<Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
	      cmp.select_next_item()
	    elseif luasnip.locally_jumpable(1) then
	      luasnip.jump(1)
	    else
	      fallback()
	    end
	  end, { "i", "s" }),

	  ["<S-Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
	      cmp.select_prev_item()
	    elseif luasnip.locally_jumpable(-1) then
	      luasnip.jump(-1)
	    else
	      fallback()
	    end
	  end, { "i", "s" }),
	})
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      -- load snippets from path/of/your/nvim/config/my-cool-snippets
      require("luasnip.loaders.from_vscode").load({ paths = { "./lua/plugins/snippets" } })
    end;
  },
  {
    "RRethy/vim-illuminate",
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-nvim-dap").setup()

      require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler (optional)
	  require("lspconfig")[server_name].setup {}
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	require('lspconfig').coffeesense.setup{}
      }
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "folke/lsp-colors.nvim"
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
  },
  {
    "mfussenegger/nvim-dap",
  },
}
