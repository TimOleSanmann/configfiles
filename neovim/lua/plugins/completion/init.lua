return {
  

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      "ray-x/cmp-treesitter",
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-cmdline',
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      -- Set up nvim-cmp.
      local cmp = require'cmp'

      local source_names = {
	nvim_lsp = "(LSP)",
	luasnip = "(Snippet)",
	buffer = "(Buffer)",
	path = "(Path)",
	treesitter = "(Tree)"
      }

      cmp.setup({
	snippet = {
	  -- REQUIRED - you must specify a snippet engine
	  expand = function(args)
	    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	  end,
	},
	window = {
	  -- completion = cmp.config.window.bordered(),
	  -- documentation = cmp.config.window.bordered(),
	},
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
	  ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- elseif luasnip.expand_or_jumpable() then
              -- luasnip.expand_or_jump()
            -- elseif neogen.jumpable() then
              -- neogen.jump_next()
            -- elseif has_words_before() then
              -- cmp.complete()
            else
              fallback()
            end
          end, {
            "i",
            "s",
            "c",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            -- elseif luasnip.jumpable(-1) then
              -- luasnip.jump(-1)
            -- elseif neogen.jumpable(true) then
              -- neogen.jump_prev()
            else
              fallback()
            end
          end, {
            "i",
            "s",
            "c",
          }),
	},
	sources = {
	  { name = "treesitter" },
	  { name = "nvim_lsp" },
	  { name = "buffer" },
	  { name = "luasnip" },
	  { name = "nvim_lua" },
	  { name = "path" },
	},
	formatting = {
	  format = function(entry, item)
	    local max_width = 80
	    local duplicates_default = 0
	    if max_width ~= 0 and #item.abbr > max_width then
	      item.abbr = string.sub(item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
	    end
	    item.menu = source_names[entry.source.name]

	    return item
	  end,
	},
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
	  { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	  }, {
	    { name = 'buffer' },
	})
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	  }, {
	    { name = 'cmdline' }
	})
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      {
        "honza/vim-snippets",
        config = function()
          require("luasnip.loaders.from_snipmate").lazy_load()

          -- One peculiarity of honza/vim-snippets is that the file with the global snippets is _.snippets, so global snippets
          -- are stored in `ls.snippets._`.
          -- We need to tell luasnip that "_" contains global snippets:
          require("luasnip").filetype_extend("all", { "_" })
        end,
      },
    },
    build = "make install_jsregexp",
    config = function()
      require("luasnip").setup()

      local snippets_folder = vim.fn.stdpath "config" .. "/lua/plugins/completion/snippets/"
      require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }

      vim.api.nvim_create_user_command("LuaSnipEdit", function()
        require("luasnip.loaders.from_lua").edit_snippet_files()
      end, {})
    end,
  }
}
