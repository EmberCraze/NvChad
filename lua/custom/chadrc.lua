local opt = vim.opt
opt.relativenumber = true
---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "everforest_light",
  theme_toggle = { "everforest_light", "gruvbox" },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M

-- Improvements needed
-- find highlighted word
-- find definitions
