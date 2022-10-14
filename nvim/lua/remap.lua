local binder = require('keymap')
local nnoremap = binder.nnoremap
local vnoremap = binder.vnoremap

nnoremap('<leader>pp', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>pf', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
nnoremap('<leader>l', '"ayiwoconsole.log(`🚀 ~ <C-R>a:`, <C-R>a)<Esc>')
nnoremap('<leader>tt', '<cmd>NERDTreeToggle<cr>')
nnoremap('<leader>tf', '<cmd>NERDTreeFocus<cr>')
nnoremap('<leader>,', '<cmd>bp<cr>')
nnoremap('<leader>.', '<cmd>bn<cr>')
nnoremap('<leader>d', '<cmd>bd<cr>')
nnoremap('<leader>o', '<cmd>OrganizeImports<cr>')

nnoremap('d', '"_d')
vnoremap('d', '"_d')
