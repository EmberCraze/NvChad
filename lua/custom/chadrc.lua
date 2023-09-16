local opt = vim.opt
opt.relativenumber = true
---@type ChadrcConfig
 local M = {}
 M.ui = {theme = 'catppuccin'}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
