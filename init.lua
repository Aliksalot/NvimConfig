vim.call('plug#begin', '~/.config/nvim/plugged')

vim.cmd([[
Plug 'sangdol/mintabline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'neovim/nvim-lspconfig'
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/everforest'
Plug 'diegoulloao/neofusion.nvim'
Plug 'shaunsingh/solarized.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'morhetz/gruvbox'
]])

vim.call('plug#end')

-- Keymaps
local map = vim.keymap.set

map('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, { expr = true })

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

map('n', '<leader>l', ":split | terminal bash -c 'git log -p; read'<cr>")
map('n', '<leader>d', ":split | terminal bash -c 'git diff; read'<cr>")

map('n', '<leader>ya', 'gg "*yG')

map('n', '<leader>c', '0i//<Esc>')

map('n', '<LEFT>', ':vertical resize -2<CR>', { silent = true })
map('n', '<RIGHT>', ':vertical resize +2<CR>', { silent = true })
map('n', '<UP>', ':resize -2<CR>', { silent = true })
map('n', '<DOWN>', ':resize +2<CR>', { silent = true })

map('i', '<LEFT>', '<Nop>')
map('i', '<RIGHT>', '<Nop>')

map('t', '<Esc>', [[<C-\><C-n>]])

-- Search word under cursor
map('n', '<leader>sa', function()
  vim.fn.setreg('/', '\\<' .. vim.fn.expand('<cword>') .. '\\>')
  vim.opt.hlsearch = true
end, { silent = true })

map('n', '<leader>ss', function()
  vim.opt.hlsearch = false
end, { silent = true })

-- Commands
vim.api.nvim_create_user_command('Vter', 'vsplit | terminal', {})

-- Functions (converted from Vimscript)
function _G.JsxFunc()
  local name = vim.fn.input("Function name: ")
  return name .. '() {}'
end

function _G.ModStyle()
  local style = vim.fn.input("Class name: ")
  return style .. '}'
end

-- Abbreviations
vim.cmd([[
iabbrev jsxfunc export default function <C-R>=v:lua.JsxFunc()<CR>
iabbrev modstyle className={style<C-R>=v:lua.ModStyle()<CR>
iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iabbrev contenttype 'Content-Type': 'application/json'
iabbrev authfail new Response(null, { status: 401 });
iabbrev normfail new Response(null, { status: 400 });
iabbrev okresp new Response(null, { status: 200 });
]])

-- Settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.path:append(".,src/**")

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false

vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c-i:block"

-- Colorscheme
vim.cmd("colorscheme gruvbox")

-- require('lspconfig').clangd.setup({})
