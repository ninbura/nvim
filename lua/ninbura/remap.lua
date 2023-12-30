-- normal mode
vim.keymap.set("n", "<leader>ge", vim.cmd.Ex) -- open file explorer

vim.keymap.set("n", "<leader>ln", function () vim.opt.relativenumber = false end) -- set line numbers non-relative
vim.keymap.set("n", "<leader>lr", function () vim.opt.relativenumber = true end) -- set line numbers relative

vim.keymap.set("n", "J", "mzJ`z") -- move next line up but keep cursor in static position

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move half page up but keep cursor in center of screen
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move half page down but keep cursor in center of screen

vim.keymap.set("n", "n", "nzzzv") -- keep cursor in center screen when going to next search
vim.keymap.set("n", "N", "Nzzzv") -- keep cursor in center screen when going to last search

vim.keymap.set("n", "<leader>y", [["+y]]) -- copy selection into system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy focused line into system clipboard

vim.keymap.set("n", "<leader>d", [["_d]]) -- delete to void register

vim.keymap.set("n", "Q", "<nop>") -- delete to void register

-- quick fix stuff
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- initiates replace for all instances of currently hovered string

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- makes currenly open bash script executable

vim.keymap.set("n", "<leader><leader>", function() -- source currently opened file
    vim.cmd("so")
end)

-- vim.keymap.set("n", "<leader>ps", "<cmd>e %homepath%/appdata/local/nvim/lua/ninbura/packer.lua<CR>"); -- Busted, not sure exactly what it does.


-- visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected lines up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected lines down

vim.keymap.set("v", "<leader>y", [["+yp]]) -- copy selection into system clipboard

vim.keymap.set("v", "<leader>d", [["_d]]) -- delete to void register


-- terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]]) -- override esc to enter normal mode


-- wtf is x mode
vim.keymap.set("x", "<leader>p", [["_dp]]) -- keep existing value in clipboard when pasting over an existing word
