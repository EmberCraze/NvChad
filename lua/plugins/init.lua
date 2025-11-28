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
  -- {
  --   'Exafunction/codeium.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'hrsh7th/nvim-cmp',
  --   },
  --   config = function()
  --     require('codeium').setup({
  --       enable_cmp_source = false,
  --       virtual_text = {
  --         enabled = true,
  --         key_bindings = {
  --           -- Accept the current completion.
  --           accept = '<M-.>',
  --         },
  --       },
  --     })
  --   end,
  -- },
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
  -- {
  --   'olimorris/codecompanion.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --     'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
  --     'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
  --     {
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       ft = { 'markdown', 'codecompanion' }, -- Optional: For prettier markdown rendering
  --       { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
  --     },
  --     config = true,
  --   },
  -- },
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
  -- {
  --   'coder/claudecode.nvim',
  --   dependencies = { 'folke/snacks.nvim' },
  --   opts = {
  --     terminal = {
  --       provider = require('tmux-claude-provider'),
  --     },
  --   },
  --   config = true,
  --   keys = {
  --     { '<leader>a', nil, desc = 'AI/Claude Code' },
  --     { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
  --     { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
  --     { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
  --     {
  --       '<leader>aC',
  --       '<cmd>ClaudeCode --continue<cr>',
  --       desc = 'Continue Claude',
  --     },
  --     { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
  --     {
  --       '<leader>as',
  --       '<cmd>ClaudeCodeSend<cr>',
  --       mode = 'v',
  --       desc = 'Send to Claude',
  --     },
  --     {
  --       '<leader>as',
  --       '<cmd>ClaudeCodeTreeAdd<cr>',
  --       desc = 'Add file',
  --       ft = { 'NvimTree', 'neo-tree', 'oil' },
  --     },
  --     -- Diff management
  --     { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
  --     { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  --   },
  -- },
  -- {
  --   'NickvanDyke/opencode.nvim',
  --   dependencies = {
  --     -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
  --     { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
  --   },
  --   keys = {
  --     { '<leader>ot', '<cmd>OpencodeToggle<cr>', desc = 'Toggle' },
  --     { '<leader>oA', '<cmd>OpencodeAsk<cr>', desc = 'Ask' },
  --   },
  --   config = function()
  --     vim.g.opencode_opts = {
  --       -- Your configuration, if any — see `lua/opencode/config.lua`
  --     }
  --
  --     -- Required for `opts.auto_reload`
  --     vim.opt.autoread = true
  --
  --     -- Recommended keymaps
  --     -- vim.keymap.set('n', '<leader>ot', function()
  --     --   require('opencode').toggle()
  --     -- end, { desc = 'Toggle' })
  --     -- vim.keymap.set('n', '<leader>oA', function()
  --     --   require('opencode').ask()
  --     -- end, { desc = 'Ask' })
  --     vim.keymap.set('n', '<leader>oa', function()
  --       require('opencode').ask('@cursor: ')
  --     end, { desc = 'Ask about this' })
  --     vim.keymap.set('v', '<leader>oa', function()
  --       require('opencode').ask('@selection: ')
  --     end, { desc = 'Ask about selection' })
  --     vim.keymap.set('n', '<leader>o+', function()
  --       require('opencode').append_prompt('@buffer')
  --     end, { desc = 'Add buffer to prompt' })
  --     vim.keymap.set('v', '<leader>o+', function()
  --       require('opencode').append_prompt('@selection')
  --     end, { desc = 'Add selection to prompt' })
  --     vim.keymap.set('n', '<leader>on', function()
  --       require('opencode').command('session_new')
  --     end, { desc = 'New session' })
  --     vim.keymap.set('n', '<leader>oy', function()
  --       require('opencode').command('messages_copy')
  --     end, { desc = 'Copy last response' })
  --     vim.keymap.set('n', '<S-C-u>', function()
  --       require('opencode').command('messages_half_page_up')
  --     end, { desc = 'Messages half page up' })
  --     vim.keymap.set('n', '<S-C-d>', function()
  --       require('opencode').command('messages_half_page_down')
  --     end, { desc = 'Messages half page down' })
  --     vim.keymap.set({ 'n', 'v' }, '<leader>os', function()
  --       require('opencode').select()
  --     end, { desc = 'Select prompt' })
  --
  --     -- Example: keymap for custom prompt
  --     vim.keymap.set('n', '<leader>oe', function()
  --       require('opencode').prompt('Explain @cursor and its context')
  --     end, { desc = 'Explain this code' })
  --   end,
  -- },
  {
    "cousine/opencode-context.nvim",
    opts = {
      tmux_target = nil, -- Manual override: "session:window.pane"
      auto_detect_pane = true, -- Auto-detect opencode pane in current window
    },
    keys = {
      {
        "<leader>oc",
        "<cmd>OpencodeSend<cr>",
        desc = "Send prompt to opencode",
      },
      {
        "<leader>oc",
        "<cmd>OpencodeSend<cr>",
        mode = "v",
        desc = "Send prompt to opencode",
      },
      {
        "<leader>ot",
        "<cmd>OpencodeSwitchMode<cr>",
        desc = "Toggle opencode mode",
      },
      {
        "<leader>op",
        "<cmd>OpencodePrompt<cr>",
        desc = "Open opencode persistent prompt",
      },
    },
    cmd = { "OpencodeSend", "OpencodeSwitchMode" },
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<M-.>",
        },
      }
    end,
  },
}
