vim.api.nvim_create_autocmd("FileType", { pattern = "netrw", callback = function()
    vim.opt.relativenumber = true
end })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", callback = function()
    if vim.bo.filetype == "copilot-chat" then
        vim.opt.relativenumber = true
    end
end })
