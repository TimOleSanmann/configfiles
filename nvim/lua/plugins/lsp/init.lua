return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    build = function()
      vim.fn.system("npm install -g typescript typescript-language-server")
      vim.fn.system("npm install -g @ansible/ansible-language-server")
      vim.fn.system("brew install lua-language-server")
      vim.fn.system("npm i -g vscode-langservers-extracted")
      vim.fn.system("npm install -g dockerfile-language-server-nodejs")
      vim.fn.system("npm install -g @microsoft/compose-language-service")
      vim.fn.system("go install golang.org/x/tools/gopls@latest")
      vim.fn.system("brew install alesbrelih/gitlab-ci-ls/gitlab-ci-ls")
    end,
    dependencies = {
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require("lspconfig").html.setup({
        capabilities = capabilities,
      })
      require("lspconfig").cssls.setup({
        capabilities = capabilities,
      })
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").tsserver.setup({})
      require("lspconfig").ansiblels.setup({})
      require("lspconfig").dockerls.setup({})
      require("lspconfig").docker_compose_language_service.setup({})
      require("lspconfig").gopls.setup({})
      require("lspconfig").gitlab_ci_ls.setup({})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local luasnip = require("luasnip")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        sources = cmp.config.sources({
          { name = "buffer" },
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          -- { name = "nvim_lsp_signature_help"}
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
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
          ["<Esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.close()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      })
    end,
  },
  {
    "github/copilot.vim",
  },
}
