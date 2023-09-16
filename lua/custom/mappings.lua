local M = {}

M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<leader>q"] = "",
	  ["<C-n>"] = "",
  }
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

return M
