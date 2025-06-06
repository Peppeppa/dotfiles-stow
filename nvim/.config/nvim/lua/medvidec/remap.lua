vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --visual mode markiertes vertikal verschieben
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz") --halbe bildschirmsprünge, curser bleibt in der Bildschirmmitte
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv") --suchfunktion, fokus immer in der Bildschirmmitte
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP') --paste yaked stuff without replacing paste buffer??

vim.keymap.set("n", "<leader>y", '"+y') -- copy into system clipboard!!!
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<Esc>", "<cmd>w<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Füge ein # am Anfang jeder markierten Zeile im Visuellen Modus ein
vim.keymap.set("v", "<leader>c", ":s/^/#/<CR>gv", { silent = true })

-- vim tmux 

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")


-- copy
-- Kopiere in das Clipboard mit Strg+c (wie in anderen Anwendungen)
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Füge aus dem Clipboard mit Strg+v ein (im normalen Modus)
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true })

