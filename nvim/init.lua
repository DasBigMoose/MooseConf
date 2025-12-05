require("config.lazy")
require("lazy").setup("plugins")
require("mason").setup()
require("mason-lspconfig").setup()
require("zk").setup({
      -- Can be "telescope", "fzf", "fzf_lua", "minipick", "snacks_picker",
      -- or select" (`vim.ui.select`).
      picker = "select",

      lsp = {
        -- `config` is passed to `vim.lsp.start(config)`
        config = {
          name = "zk",
          cmd = { "zk", "lsp" },
          filetypes = { "markdown" },
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
        },
      },
    })

local builtin = require('telescope.builtin')

--filetype plugin indent on
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.cursorline = true
vim.opt.foldmethod = "manual"
vim.opt.exrc = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.diagnostic.config({ virtual_text = true })


vim.g.rehash256 = 1
vim.cmd("colorscheme molokai")

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

--Music Control
vim.keymap.set('n', '<C-.>', ':!mpc next<cr><cr>')
vim.keymap.set('n', '<C-,>', ':!mpc prev<cr><cr>')
vim.keymap.set('n', '<C-p>', ':!mpc toggle<cr><cr>')
vim.keymap.set('n', '<leader>mm', ':split|terminal ncmpcpp<cr>i')

vim.keymap.set('n', '<Leader>rs', ':source ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<Leader>re', ':e ~/.config/nvim/init.lua<cr>')

--vim.keymap.set('n', '<Tab>', ':TagbarToggle<cr>')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {cwd = "src"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<Tab>', builtin.lsp_document_symbols, {})

vim.keymap.set('n', '<C-c>', '"+')

vim.keymap.set('n', '<leader>cto', ':tabonly<cr>')

vim.g.EasyMotion_smartcase = 1
vim.keymap.set('n', '<PLUG>(easymotion-sn)', '')
vim.keymap.set('o', '<PLUG>(easymotion-tn)', '')
vim.keymap.set('n', '<Plug>(easymotion-next)', '')
vim.keymap.set('n', '<Plug>(easymotion-prev)', '')


vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')

vim.keymap.set('n', '<plug>(SubversiveSubstitute)', '')
vim.keymap.set('n', '<plug>(SubversiveSubstituteLine)', '')
vim.keymap.set('n', '<plug>(SubversiveSubstituteToEndOfLine)', '')

-- vim.g.UltiSnipsExpandTrigger="<c-e>"
-- vim.g.UltiSnipsJumpForwardTrigger="<Leader>n"
-- vim.g.UltiSnipsJumpBackwardTrigger="<Leader>p"

-- vim.g.UltiSnipsEditSplit="vertical"

-- require('lint').linters_by_ft = {
--   gdscript = {'gdtoolkit',}
-- }
--

-- ZK
local opts = { noremap=true, silent=false }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>zi", "<Cmd>ZkInsertLink<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
	pattern = {"*.vert", "*.frag"},
	callback = function() vim.cmd("set filetype=glsl") end
})


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "gdscript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

 -- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end
      }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'ultisnips' }, -- For ultisnips users.
      }, {
        { name = 'buffer' },
      })
  })

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
require('lspconfig')['intelephense'].setup {
  capabilities = capabilities
}

require('lspconfig')['glsl_analyzer'].setup {
  capabilities = capabilities
}
require('lspconfig')['cmake'].setup {
  capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}

require('lspconfig')['gopls'].setup {
  capabilities = capabilities
}

require('lspconfig')['gdscript'].setup {
  capabilities = capabilities
}

require('lspconfig')['vuels'].setup {
  capabilities = capabilities
}

require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "php", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    file_ignore_patterns =  {
        "^bucket",
        "^legacy",
        "^node_modules",
        "^notes",
        "^printcenter",
        "^silo",
        "^tools",
        "^vagrant",
        "^website",
        "%.svg",
    },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-f>"] = "results_scrolling_down",
        ["<C-b>"] = "results_scrolling_up",
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

-- Set up trouble
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})

require('telescope').load_extension('fzf')
