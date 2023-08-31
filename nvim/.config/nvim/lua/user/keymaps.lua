local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

-- Map ESC to clear search highlighting
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Split resizing
keymap("n", "<Leader>iw", "<C-w>10><CR>", opts)
keymap("n", "<Leader>dw", "<C-w>10<<CR>", opts)
keymap("n", "<Leader>ih", "<C-w>10+<CR>", opts)
keymap("n", "<Leader>dh", "<C-w>10-<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-bn>", ":bnext<CR>", opts)
-- keymap("n", "<S-bp>", ":bprevious<CR>", opts)

-- Navigate tabs
keymap("n", "<C-h>", ":tabprevious<CR>", opts)
keymap("n", "<C-l>", ":tabnext<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Go to prev file
keymap("n", "<C-b>", ":e#<CR>", opts)

-- Telescope find files
keymap("n", "<C-p>", ":Telescope find_files <CR>", opts)

-- Add console.log() to next line
keymap("n", "<Leader>l", "oconsole.log()<Esc>F(a", opts)

-- Insert --
-- Press jk fast to exit insert mode a save
keymap("i", "jk", "<ESC>:w<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
