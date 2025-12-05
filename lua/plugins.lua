return {
	'preservim/nerdtree',
	'mg979/vim-visual-multi',
	'preservim/tagbar',
	'easymotion/vim-easymotion',
	'Raimondi/delimitMate',
	'wincent/ferret',
	'svermeulen/vim-subversive',
	'SirVer/ultisnips',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'mfussenegger/nvim-lint',

	'tpope/vim-surround',
	'tpope/vim-fugitive',
	'tpope/vim-sensible',
	'tpope/vim-commentary',
	'tpope/vim-endwise',
	'tpope/vim-unimpaired',
	'tpope/vim-repeat',

	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',

	'vim-airline/vim-airline',
	'vim-airline/vim-airline-themes',
	'tomasr/molokai',
	'tribela/vim-transparent',
	    "zk-org/zk-nvim",

	'habamax/vim-godot',
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
	'christoomey/vim-system-copy',
	'nvim-lua/plenary.nvim',
	{'nvim-treesitter/nvim-treesitter', build = 'TSUpdate'},
	'nvim-telescope/telescope.nvim',
	-- {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
	{'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'BurntSushi/ripgrep'
}
