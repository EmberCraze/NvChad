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
        "markdown",
        "markdown_inline",
      },
    },
  },
  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "nvimtools/none-ls.nvim",
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
        "gopls",
        "gofumpt",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "cmp_tabnine" },
        { name = "codeium" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
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
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
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
      require "custom.configs.nvim-dap"
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
}

return plugins
