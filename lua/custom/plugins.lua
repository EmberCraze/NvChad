local plugins = {
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
      },
    },
  },
  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "pyright",
        "black",
        "flake8",
        "sourcery",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "cmp_tabnine" },
        -- { name = "codeium" },
      },
    },

    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 5,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
            show_prediction_strength = false,
          } -- put your options here
        end,
      },
      {
        "Exafunction/codeium.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "hrsh7th/nvim-cmp",
        },
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },
  {
    "glacambre/firenvim",

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      -- For auto save to buffer
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
        callback = function(e)
          if vim.g.timer_started == true then
            return
          end
          vim.g.timer_started = true
          vim.fn.timer_start(10000, function()
            vim.g.timer_started = false
            vim.cmd "write"
          end)
        end,
      })

      vim.g.firenvim_config = {
        localSettings = {
          [".*"] = {
            takeover = "never",
            cmdline = "firenvim",
          },
        },
      }
    end,
  },
  {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-vim-test" {
            allow_file_types = { "python" },
          },
        },
      }
      require("core.utils").load_mappings "neotest"
    end,
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
      require("core.utils").load_mappings "vim_test"
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
      -- {
      --   "mfussenegger/nvim-dap-python",
      -- },
      {

        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup {}
        end,
      },
    },
    config = function()
      require "custom.configs.nvim-dap"
    end,
  },
  -- {
  --   "schrieveslaach/sonarlint.nvim",
  --   url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  --   event = "BufEnter *.py",
  --   config = function()
  --     require("sonarlint").setup {
  --       server = {
  --         cmd = {
  --           "sonarlint-language-server",
  --           -- Ensure that sonarlint-language-server uses stdio channel
  --           "-stdio",
  --           "-analyzers",
  --           -- paths to the analyzers you need, using those for python and java in this example
  --           vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarpython.jar",
  --           vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarcfamily.jar",
  --           vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjava.jar",
  --         },
  --       },
  --       filetypes = {
  --         -- Tested and working
  --         "python",
  --         -- "cpp",
  --         -- Requires nvim-jdtls, otherwise an error message will be printed
  --         -- "java",
  --       },
  --     }
  --   end,
  -- },
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
}

return plugins
