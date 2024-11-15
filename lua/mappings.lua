require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local M = {}
M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    -- ["<,tc>"] = { " ", "+Custom tests" },
    ["<,tch"] = {
      function()
        -- setup volume with scripts
        -- modify yml file to run with the right context
        -- parse file and identify test name
        -- run code in tmux terminal
      end,
      "Test here",
    },
    -- ["K"] = { "<cmd> Lspsaga hover_doc <CR>" },
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

M.lspsaga = {
  n = {
    ["<leader>lo"] = { "<cmd> Lspsaga outline <CR>", "Open outline" },
  },
}

M.vim_test = {
  n = {
    -- [",t"] = { " ", "+Testing" },
    [",ta"] = { "<cmd> TestSuit <CR>", "Run all tests" },
    [",th"] = {
      function()
        vim.g["test#python#djangotest#executable"] = "bash " .. vim.fn.getcwd() .. "/.nvim/start_test.sh"
        vim.api.nvim_command "TestNearest"
      end,
      "Test here",
    },
    -- [",tc"] = { "<cmd> TestClass <CR>", "Test class" },
    [",tf"] = { "<cmd> TestClass <CR>", "Test file" },
    -- [",tc"] = { " ", "+Testing Coverage" },
    [",tch"] = {
      function()
        vim.g["test#python#djangotest#executable"] = "COVERAGE_ENABLED=true "
          .. "bash "
          .. vim.fn.getcwd()
          .. "/.nvim/start_test.sh"
        vim.api.nvim_command "TestNearest"
      end,
      "Test here with coverage",
    },
  },
}

M.neotest = {
  n = {
    -- [",tn"] = { " ", "+Neotest" },
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

M.diffview = {
  n = {
    ["<leader>gdo"] = { "<cmd> DiffviewOpen <CR>", "Diffview open" },
    ["<leader>gdc"] = { "<cmd> DiffviewClose <CR>", "Diffview close" },
    ["<leader>gdh"] = { "<cmd> DiffviewFileHistory <CR>", "Diffview history" },
    ["<leader>gdf"] = { "<cmd> DiffviewFileHistory % <CR>", "Diffview current file history" },
  },
}

M.nvimdap = {
  n = {
    -- [",d"] = { " ", "+Debug" },
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
    -- [",ds"] = { " ", "+Steps" },
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
    -- [",dt"] = { "", "+Tests" },
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

M.hover = {
  n = {
    ["K"] = {
      function()
        require("hover").hover()
      end,
      "Hover info",
    },
    ["<C-p>"] = {
      function()
        require("hover").hover_switch "previous"
      end,
      "hover.nvim (previous source)",
    },
    ["<C-n>"] = {
      function()
        require("hover").hover_switch "next"
      end,
      "hover.nvim (next source)",
    },
  },
}
M.codeium = {
  i = {
    -- ["<M-.>"] = {
    --   function()
    --     require("codeium.virtual_text").accept()
    --   end,
    --   "Code accept",
    -- },
    -- ["<M-,>"] = {
    --   function()
    --     require("codeium.virtual_text").complete()
    --   end,
    --   "Code complete",
    -- },
  },
  n = {

    -- next command
    ["<leader>ccn"] = {
      function()
        require("codeium.virtual_text").cycle_or_complete()
      end,
      "Code next",
    },
  },
}

-- for mode, maps in pairs(mappings) do
--   for key, val in pairs(maps) do
--     map(mode, key, val[1], val[2])
--   end
-- end

for _, category in pairs(M) do
  for mode, mode_maps in pairs(category) do
    for key, mapping in pairs(mode_maps) do
      map(mode, key, mapping[1], { desc = mapping[2] })
    end
  end
end
