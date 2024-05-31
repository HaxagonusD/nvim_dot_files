require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- I hate escape more than anything else 
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "kk", "<ESC>")
-- Paste in visual mode without copying
map('x', 'p', 'pgvy', {noremap = true})

map('n', '<leader>s', ':w<CR>', {noremap = true, silent = true})
map('n', '<leader>q', ':q!<CR>', {noremap = true, silent = true})
map('n', '<leader>j', '<C-W>j', {noremap = true})
map('n', '<leader>k', '<C-W>k', {noremap = true})
map('n', '<leader>l', '<C-W>l', {noremap = true})
map('n', '<leader>h', '<C-W>h', {noremap = true})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Pressing enter in normal more will create a newline
map("n", "<CR>", "o<Esc>", {noremap = true})
map("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- start the substitution processes
map("n", "<leader>rs", ":%s/")

-- git commits
map("n", "<leader>gs", ":Telescope git_commits<CR>")

-- nvim.Spectre for search and replace
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
