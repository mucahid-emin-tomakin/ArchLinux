--
--
--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
  return {
    {
      'ramboe/ramboe-dotnet-utils',
      dependencies = { 'mfussenegger/nvim-dap' },
      opts = {
        fzflua_razor_outline_preview_context = 5,
        fzflua_razor_outline_preview_window = "up:60%",
        fzflua_razor_outline_prompt = "Razor> ",
      },
      config = function(_, opts)
        require("fzf-lua-pickers-razor-outline").setup(opts)
      end,
    },
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      -- or if using mini.icons/mini.nvim
      -- dependencies = { "echasnovski/mini.icons" },
      opts = {}
    },
    {
      "stevearc/conform.nvim",
      event = 'BufWritePre', -- uncomment for format on save
      config = function()
        require "configs.conform"
      end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    { 'akinsho/git-conflict.nvim', version = "*", config = true },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "configs.lspconfig"
      end,
    },
    {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy", -- Or `LspAttach`
      priority = 1000,    -- needs to be loaded in first
      config = function()
        require("configs.tiny-inline-diagnostic")
      end
    },
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
        ensure_installed = {
          "lua-language-server",
          "xmlformatter",
          "stylua",
          "bicep-lsp",
          "html-lsp",
          "css-lsp",
          "eslint-lsp",
          "typescript-language-server",
          "csharpier",
          "prettier",
          "json-lsp",
          "yaml-language-server",
          "markdown-oxide",

          -- for some reason those have to be installed explicitely with MasonInstall
          -- quick fix for breaking change from 18-may-26
          -- "roslyn@5.8.0-1.26266.2",  -- don't forget to do :MasonUninstall roslyn, then :MasonInstall roslyn@5.8.0-1.26266.2
          "netcoredbg"
        },
      },
    },

    {
      "nvim-treesitter/nvim-treesitter",
      branch = "main", -- since we are using the latest nvim
      build = ":TSUpdate",
      opts = {
        ensure_installed = {
          "hyprlang",
          "vim",
          "lua",
          "vimdoc",
          "html",
          "css",
          "c_sharp",
          "bicep",
          "razor",
          "yaml",
          "caddy",
          "bash"
        },
      },
      config = function(_, opts)
        -- require("nvim-treesitter.configs").setup(opts)

        -- I don't know why they make me do this recently
        vim.treesitter.language.register("bash", "conf")
        vim.treesitter.language.register("bash", "kitty")
        vim.treesitter.language.register("bash", "tmux")
        vim.treesitter.language.register("bash", "sh")
      end,
    },
    {
      "numToStr/Comment.nvim",
      lazy = false,
      opts = {
        toggler = {
          ---Line-comment toggle keymap
          line = "gcc",
          ---Block-comment toggle keymap
          block = "gbc",
        },
      },
    },
    {
      -- Debug Framework
      "mfussenegger/nvim-dap",
      dependencies = {
        "rcarriga/nvim-dap-ui",
      },
      -- config = function()
      --   require "custom-config.nvim-dap"
      -- end,
      event = "VeryLazy",
    },
    {
      "nsidorenco/neotest-vstest"
    },
    { "nvim-neotest/nvim-nio" },
    {
      -- UI for debugging
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap",
      },
      -- config = function()
      --   require "custom-config.nvim-dap-ui"
      -- end,
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },

    {
      "L3MON4D3/LuaSnip",
      lazy = false,
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" }
    },
    {
      "nvim-neotest/neotest",
      requires = {
        {
          "Issafalcon/neotest-dotnet",
        }
      },
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
      }
    },
    {
      "Issafalcon/neotest-dotnet",
      lazy = false,
      dependencies = {
        "nvim-neotest/neotest"
      }
    },
    { "smithbm2316/centerpad.nvim" },
  }
--
--
--