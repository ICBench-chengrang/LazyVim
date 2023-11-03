-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
keymap.set({'i', 'n'}， '<C-o>', '', {silent = true, remap = false})
keymap.set("i", "<C-o>", "<Esc>")
keymap.set("n", "<C-o><C-o>", ":w<CR>", {silent = true, remap = false})
