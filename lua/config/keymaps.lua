-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
keymap.set("i", "<C-l>", "<Right>")

keymap.set({ "i", "x", "s" }, "<C-k>", "<esc>l", { silent = true, remap = false })
keymap.set("n", "<C-k><C-k>", "<cmd>w<cr>", { silent = true, remap = false })
