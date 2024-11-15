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

    -- dependencies = {
    --   "nvimtools/none-ls.nvim",
    --   config = function()
    --     require "configs.null-ls"
    --   end,
    -- },
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "lua-language-server",
  --       "typescript-language-server",
  --       "html-lsp",
  --       "prettier",
  --       "stylua",
  --       "pyright",
  --       "black",
  --       "flake8",
  --       "gopls",
  --       "gofumpt",
  --     },
  --   },
  -- },
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
      -- {
      --   "tzachar/cmp-tabnine",
      --   build = "./install.sh",
      --   config = function()
      --     local tabnine = require "cmp_tabnine.config"
      --     tabnine:setup {
      --       max_lines = 1000,
      --       max_num_results = 5,
      --       sort = true,
      --       run_on_every_keystroke = true,
      --       snippet_placeholder = "..",
      --       show_prediction_strength = false,
      --     } -- put your options here
      --   end,
      -- },
      "Exafunction/codeium.nvim",
    },
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
          key_bindings = {
            -- Accept the current completion.
            accept = "<M-.>",
          },
        },
      }
    end,
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
  -- {
  --   "glacambre/firenvim",
  --
  --   -- Lazy load firenvim
  --   -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  --   lazy = not vim.g.started_by_firenvim,
  --   build = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  --   config = function()
  --     -- For auto save to buffer
  --     vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  --       callback = function(e)
  --         if vim.g.timer_started == true then
  --           return
  --         end
  --         vim.g.timer_started = true
  --         vim.fn.timer_start(10000, function()
  --           vim.g.timer_started = false
  --           vim.cmd "write"
  --         end)
  --       end,
  --     })
  --
  --     vim.g.firenvim_config = {
  --       localSettings = {
  --         [".*"] = {
  --           takeover = "never",
  --           cmdline = "firenvim",
  --         },
  --       },
  --     }
  --   end,
  -- },
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
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- build = "luarocks install lua-xmlreader", -- Optional: needed for PHP when using the cobertura parser
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
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }, -- Optional: For prettier markdown rendering
        { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
      },
      config = true,
    },
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
}
