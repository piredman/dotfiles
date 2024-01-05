vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true

vim.wo.number = true
vim.wo.relativenumber = true

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
