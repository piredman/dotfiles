-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>") -- Back to Normal Mode with "jk"
vim.keymap.set("n", "x", '"_x"') -- Delete the character but do not copy into registers

-- maps learned from ThePrimeagen Vim As Your Editor Playlist
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Page down and keep cursor in center of screen
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Page up and keep cursor in center of screen

vim.keymap.set("n", "n", "nzzzv") -- Move to next search result, keep cursor in center, open all folds
vim.keymap.set("n", "N", "Nzzzv") -- Move to previous search result, keep cursor in center, open all folds

vim.keymap.set("v", "<leader>p", '"_dP') -- Paste text and do not replace register with removed text

-- buffers
vim.keymap.set("n", "<leader>bx", "<cmd>%bd|e#|bd#<cr>", { desc = "Delete all buffers" }) -- delete all buffers (%bd), open last buffer for editing (e#), delete [No Name] buffers (bd#)
