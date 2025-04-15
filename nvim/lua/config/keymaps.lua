-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

-- Save
map("n", "<leader><Space>", "<cmd>w<CR>", { desc = "Write File" })

-- Run python file
vim.keymap.set("n", "<leader>rr", ":!python3 %<CR>", { desc = "Run current Python file" })
