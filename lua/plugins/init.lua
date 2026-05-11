return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "python",
        "markdown",
        "markdown_inline",
      },
    },
  },
  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        -- { name = "cmp_tabnine" },
        { name = "codeium" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    },

    dependencies = {
      "Exafunction/codeium.nvim",
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          folder_level = 3,
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "LspAttach",
  },
  {
    "vim-test/vim-test",
    lazy = false,
    config = function()
      -- vim.g["test#python#djangotest#executable"] =
      --   "docker-compose -f local.yml run --rm django python manage.py test --noinput --parallel 8 --exclude-tag=integration --settings=config.settings.test"
      vim.g["test#python#djangotest#executable"] = "bash " .. vim.fn.getcwd() .. "/.nvim/start_test.sh"
      vim.g["test#strategy"] = "slimux"
      vim.g["test#project_root"] = vim.fn.getcwd()
      -- require("core.utils").load_mappings "vim_test"
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { "," },
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      {

        "rcarriga/nvim-dap-ui",
        dependencies = {
          { "nvim-neotest/nvim-nio" },
        },
        config = function()
          require("dapui").setup {}
        end,
      },
    },
    config = function()
      require "configs.nvim-dap"
    end,
  },
  {
    "NvChad/nvterm",
    opts = {
      terminals = {
        type_opts = {
          float = {
            row = 0.05,
            col = 0.025,
            width = 0.95,
            height = 0.9,
          },
        },
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "esamattis/slimux",
    lazy = false,
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%m-%d-%Y %H:%M:%S",
      virtual_text_column = 1,
    },
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    lang = { python = { coverage_file = "./.coverage" } },
    version = "*",
    config = function()
      require("coverage").setup {
        auto_reload = true,
      }
    end,
  },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require "hover.providers.lsp"
          -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          require "hover.providers.dap"
          -- require('hover.providers.fold_preview')
          require "hover.providers.diagnostic"
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = "single",
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
        mouse_providers = {
          "LSP",
        },
        mouse_delay = 1000,
      }
      require "configs.hover"
    end,
  },
  {
    "rcarriga/nvim-notify",
    -- opts = {
    --   render = "compact",
    -- },
    init = function()
      vim.notify = require "notify"
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<M-.>",
        },
      }
    end,
  },
}
