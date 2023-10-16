-- Space as leader key
vim.g.mapleader = ' '

-- Move to window using <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "Go to left window", remap = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "Go to lower window", remap = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "Go to upper window", remap = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "Go to right window", remap = true})

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Shortcuts
vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^', {desc = "Goto line start"})
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_', {desc = "Goto line end"})
vim.keymap.set('n', '<C-a>', ':keepjumps normal! ggVG<cr>', {desc = "Select all"})

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = "Copy in clipboard"}) -- copy
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = "Paste from clipboard"}) -- paste

-- Delete text
vim.keymap.set({'n', 'x'}, 'x', '"_x', {desc = "Delete text"})

-- Commands
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', 'bl', '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set('n', 'bh', '<cmd>BufferLineCycleNext<cr>')

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
