local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'preservim/nerdtree'
Plug 'mg979/vim-visual-multi'
Plug 'preservim/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'wincent/ferret'
Plug 'svermeulen/vim-subversive'
Plug 'SirVer/ultisnips'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'tribela/vim-transparent'

Plug 'habamax/vim-godot'

Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'

Plug 'christoomey/vim-system-copy'
vim.call('plug#end')

require("mason").setup()
require("mason-lspconfig").setup()

--filetype plugin indent on
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.cursorline = true
vim.opt.foldmethod = "manual"
vim.opt.exrc = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.rehash256 = 1
vim.cmd("colorscheme molokai")

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<Leader>rs', ':source ~/.config/nvim/init.vim<cr>')
vim.keymap.set('n', '<Leader>re', ':e ~/.config/nvim/init.vim<cr>')

vim.keymap.set('n', '<Tab>', ':TagbarToggle<cr>')

vim.keymap.set('n', '<C-c>', '"*')

vim.keymap.set('n', '<leader>cto', ':tabonly<cr>')

vim.g.ctrlp_extensions = {'tag', 'buffertag', 'undo', 'line', 'changes', 'mixed'}
vim.g.ctrlp_custom_ignore = '\v[/](public|node_modules|target|dist|vendor|bower_component|storage|migrations|build|bucket|silo|UserSettings|ProjectSettings|Packages|Logs|Library)|(.(swp|ico|git|svn|jpg|eps|png|gif|pdf|csproj|txt|tscn|tres|import|blend|blend1))$'

vim.g.EasyMotion_smartcase = 1
vim.keymap.set('n', '<PLUG>(easymotion-sn)', '')
vim.keymap.set('o', '<PLUG>(easymotion-tn)', '')
vim.keymap.set('n', '<Plug>(easymotion-next)', '')
vim.keymap.set('n', '<Plug>(easymotion-prev)', '')


vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')

vim.keymap.set('n', '<plug>(SubversiveSubstitute)', '')
vim.keymap.set('n', '<plug>(SubversiveSubstituteLine)', '')
vim.keymap.set('n', '<plug>(SubversiveSubstituteToEndOfLine)', '')

vim.g.UltiSnipsExpandTrigger="<c-e>"
vim.g.UltiSnipsJumpForwardTrigger="<Leader>n"
vim.g.UltiSnipsJumpBackwardTrigger="<Leader>p"

vim.g.UltiSnipsEditSplit="vertical"


-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
      }, {
        { name = 'buffer' },
      })
  })

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
{ name = 'git' },
}, {
{ name = 'buffer' },
})
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['gdscript'].setup {
  capabilities = capabilities
}
