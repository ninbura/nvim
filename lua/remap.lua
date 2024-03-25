-- normal mode
vim.keymap.set("n", "<leader>ge", vim.cmd.Ex, { desc = "open file explorer" })

vim.keymap.set("n", "<leader>ln", function () vim.opt.relativenumber = false end, { desc = "set line numbers non-relative" })
vim.keymap.set("n", "<leader>lr", function () vim.opt.relativenumber = true end, {desc = "set line numbers relative" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "move next line up but keep cursore in static position" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move half page up but keep cursor in center of screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move half page down but keep cursor in center of screen" })

vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor in center screen when going to next search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor in center screen when going to previous search" })

vim.keymap.set("n", "<leader>d", [["_d]], { desc = "delete to void register" })

vim.keymap.set("n", "Q", "<nop>", { desc = "disable ex mode" })

vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "initiates replace for all instances of currently hovered string" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make open file executable" })

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "source current file" })

vim.keymap.set("n", "<leader>pv", "<C-w>v<C-w>l", { desc = "split window vertically and move to new split" })
vim.keymap.set("n", "<leader>ph", "<C-w>s<C-w>j", { desc = "split window horizontally and move to new split" })

vim.keymap.set("n", "<leader>cc", ":CopilotChatOpen<CR>", { desc = "open copilot chat" })
vim.keymap.set("n", "<leader>cq", ":CopilotChatClose<CR>", { desc = "close copilot chat" })

for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<leader>p'..i, ':'..i..'wincmd w<CR>', { desc = "move to window " .. i })
end

vim.keymap.set("n", "<leader>=", ":windo vertical resize<CR>", { desc = "resize all windows to equal width" })

vim.keymap.set("n", "<leader>fr", "*#cgn", { desc = "Delete word under cursor, sets up find and replace by pressing [.] after." })

-- visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected lines up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected lines down" })

vim.keymap.set("v", "<leader>d", [["_d]], { desc = "delete to void register" })

-- terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "override esc to enter normal mode" })

-- wtf is x mode
vim.keymap.set("x", "<leader>p", [["_dp]], { desc = "paste without yanking" })
