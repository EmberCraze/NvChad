local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed={
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "python"
      }
    }
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
						snippet_placeholder = '..',
						show_prediction_strength = false
					} -- put your options here
			end,
		  },
		},
	},
	{
		'glacambre/firenvim',

		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end,
		config = function()
			-- For auto save to buffer
			vim.api.nvim_create_autocmd({'TextChanged', 'TextChangedI'}, {
				callback = function(e)
					if vim.g.timer_started == true then
						return
					end
					vim.g.timer_started = true
					vim.fn.timer_start(10000, function()
						vim.g.timer_started = false
						vim.cmd('write')
					end)
				end
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
}

return plugins
