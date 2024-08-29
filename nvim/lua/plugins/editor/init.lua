return {
  {
    -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.cmd("TSUpdate")
      require("nvim-treesitter.configs").setup({
        auto_install = true,
      })
    end,
  },
  {
    "wfxr/minimap.vim",
    build = "brew install code-minimap",
    init = function() end,
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    priority = 1000,
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      tabpages = true,
      sidebar_filetypes = {
        NvimTree = { text = "File Explorer", align = "center" },
      },
      icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        -- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true },
          [vim.diagnostic.severity.WARN] = { enabled = true },
          [vim.diagnostic.severity.INFO] = { enabled = true },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
      },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
      -- empty setup using defaults
      require("nvim-tree").setup({
        view = {
          width = "150",
        },
        update_focused_file = {
          enable = true,
        },

        diagnostics = {
          enable = true,
          show_on_open_dirs = true,
          show_on_dirs = true,
          debounce_delay = 50,
        },
        actions = {
          open_file = {
            resize_window = false, -- don't resize window when opening file
          },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")

      wk.add({
        -- f = { name = "file" },
        -- e = { name = "explorer" },
        -- z = { ":Lazy<cr>", "Open Lazygit" },
        {
          { "<leader>b", group = "Buffer" },
          { "<leader>e", group = "NvimTree", icon = "" },
          { "<leader>w", group = "Window" },
          { "<leader>l", group = "LSP | Code Actions" },
          { "<leader>bm", group = "Move" },
          { "<leader><leader>", group = "Hop" },
          { "<leader>f", group = "Telescope" },
          { "<leader>fl", group = "Telescope LSP" },
        },

        -- c = { name = "config" },
        -- ["<leader><leader>"] = { name = "+Fast Commands" },
        -- ["b"] = { name = "+Buffer" },
        -- ["m"] = { name = "+Markdown"},
        -- ["s"] = { name = "+Spell checking"},
        -- ["p"] = { name = "+Session"},
        -- ["d"] = { name = "+Diffview"},
        -- ["l"] = { name = "+LSP"},
        -- ["v"] = { name = "+Vimux"},
        -- ["g"] = { name = "+Git"},
        -- ["x"] = { name = "+Todo"},
      })
    end,
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        extensions = {
          "nvim-tree",
          "quickfix",
        },
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      local logo = [[
      ██████╗ ███████╗███████╗██████╗     ██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
      ██╔══██╗██╔════╝██╔════╝██╔══██╗    ██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
      ██║  ██║█████╗  █████╗  ██████╔╝    ██║ █╗ ██║██║   ██║██████╔╝█████╔╝
      ██║  ██║██╔══╝  ██╔══╝  ██╔═══╝     ██║███╗██║██║   ██║██╔══██╗██╔═██╗
      ██████╔╝███████╗███████╗██║         ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
      ╚═════╝ ╚══════╝╚══════╝╚═╝          ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = vim.split(logo, "\n"),
          center = {
            {
              icon = " ",
              icon_hl = "Title",
              desc = "Search files",
              desc_hl = "String",
              key = "f",
              key_hl = "Number",
              key_format = " [%s]", -- `%s` will be substituted with value of `key`
              action = "Telescope find_files",
            },
            {
              icon = "󰱼 ",
              icon_hl = "Title",
              desc = "Search string",
              desc_hl = "String",
              key = "g",
              key_hl = "Number",
              key_format = " [%s]", -- `%s` will be substituted with value of `key`
              action = "Telescope live_grep",
            },
            {
              icon = " ",
              icon_hl = "Title",
              desc = "Open Tree",
              desc_hl = "String",
              key = "e",
              key_hl = "Number",
              key_format = " [%s]", -- `%s` will be substituted with value of `key`
              action = "NvimTreeToggle",
            },
            {
              icon = "󰦛 ",
              icon_hl = "Title",
              desc = "Restore session",
              desc_hl = "String",
              key = "p",
              key_format = " [%s]",
              key_hl = "Number",
              action = 'lua require("persistence").load()',
            },
            {
              icon = " ",
              icon_hl = "Title",
              desc = "Open Lazy",
              desc_hl = "String",
              key = "l",
              key_format = " [%s]",
              key_hl = "Number",
              action = "Lazy",
            },
          },
        },
      })
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup({
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
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "tpope/vim-commentary",
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "stevearc/conform.nvim",
    build = function()
      vim.cmd("!brew install stylua")
      vim.cmd("!npm install -g prettier")
      vim.cmd("!go install cmd/gofmt@latest")
    end,
    opts = {},
    config = function()
      require("conform").setup({
        formatters = {
          stylua = {
            command = "stylua",
            args = {
              "--column-width",
              "120",
              "--indent-type",
              "Spaces",
              "--indent-width",
              "2",
              "--",
              "-", -- use stdin for input
            },
          },
          prettier = {
            command = "prettier",
            args = {
              "--stdin-filepath",
              "$FILENAME",
              "--tab-width",
              "2",
            },
          },
        },
        formatters_by_ft = {
          lua = { "stylua" },
          html = { "prettier" },
          css = { "prettier" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          go = { "gofmt" },
        },
      })
      vim.keymap.set(
        "n",
        "<leader>lf",
        require("conform").format,
        { noremap = true, silent = true, desc = "Conform format" }
      )
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
