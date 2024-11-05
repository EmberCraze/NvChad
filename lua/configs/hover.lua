-- Setup keymaps
-- vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
-- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})

-- Mouse support
vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true
