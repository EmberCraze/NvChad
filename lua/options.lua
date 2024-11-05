require "nvchad.options"

local o = vim.o
o.relativenumber = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false
