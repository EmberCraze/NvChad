local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<,tc>"] = { " ", "+Custom tests" },
    ["<,tch"] = {
      function()
        -- setup volume with scripts
        -- modify yml file to run with the right context
        -- parse file and identify test name
        -- run code in tmux terminal
      end,
      "Test here",
    },
  },
}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>q"] = "",
    ["<C-n>"] = "",
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.tabufline = {
  n = {
    -- close buffer + hide terminal buffer
    ["<leader>qb"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },

    ["<leader>qa"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close buffer",
    },
  },
}
M.vim_test = {
  plugin = true,
  n = {
    [",t"] = { " ", "+Testing" },
    [",ta"] = { "<cmd> TestSuit <CR>", "Run all tests" },
    [",th"] = { "<cmd> TestNearest <CR>", "Test here" },
    [",tc"] = { "<cmd> TestClass <CR>", "Test class" },
    [",tf"] = { "<cmd> TestClass <CR>", "Test file" },
  },
}

M.neotest = {
  plugin = true,
  n = {
    [",tn"] = { " ", "+Neotest" },
    -- [",ta"] = { "<cmd> TestSuit <CR>", "Run all tests"},
    [",tnh"] = {
      function()
        require("neotest").run.run()
      end,
      "Test here",
    },
    [",tnf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Test file",
    },
    -- [",tc"] = { "<cmd> TestClass <CR>", "Test class"},
    -- [",tf"] = { "<cmd> TestClass <CR>", "Test file"},
  },
}

M.nvimdap = {
  -- plugin = true,
  n = {
    [",d"] = { " ", "+Debug" },
    [",db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Break point",
    },
    [",di"] = {
      function()
        vim.cmd("SlimuxShellRun" .. " bash " .. vim.fn.getcwd() .. "/.nvim/start_debug.sh")
      end,
      "Initiate",
    },
    [",dc"] = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },
    [",dso"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    [",ds"] = { " ", "+Steps" },
    [",dsi"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },
    [",dr"] = {
      function()
        vim.cmd("SlimuxShellRun" .. " bash " .. vim.fn.getcwd() .. "/.nvim/start_debug.sh")
        require("dap").continue()
      end,
      "Run",
    },
    [",de"] = {
      function()
        require("dap").terminate()
      end,
      "Terminate",
    },
    [",dt"] = { "", "+Tests" },
    [",dta"] = {
      function()
        vim.g["test#python#djangotest#executable"] = "bash " .. vim.fn.getcwd() .. "/.nvim/start_debug_test.sh"
        vim.api.nvim_command "TestSuit"
      end,
      "Debug all tests",
    },
    [",dth"] = {
      function()
        require("dap").continue()
        vim.g["test#python#djangotest#executable"] = "bash " .. vim.fn.getcwd() .. "/.nvim/start_debug_test.sh"
        vim.api.nvim_command "TestNearest"
      end,
      "Debug test here",
    },
  },
}

return M
