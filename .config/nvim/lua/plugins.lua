vim.cmd('packadd packer.nvim')         -- Load package manager

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    -- Native LSP
    use {'neovim/nvim-lspconfig'}
    -- completion engine
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/nvim-cmp'}
    -- snippets
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}

    -- This is that bar at the bottom
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    -- Used by vim-colorscheme-switcher
    use {'xolox/vim-misc'}
    -- Used to quickly switch colorschemes
    use {'xolox/vim-colorscheme-switcher'}

    -- This plugin causes trailing whitespace to be highlighted in red.
    -- To delete the trailing whitespace, call :FixWhitespace
    use {'bronson/vim-trailing-whitespace'}
    -- Surround.vim is all about \"surroundings\": parentheses, brackets,
    -- quotes, XML tags, and more. The plugin provides mappings to easily
    -- delete, change and add such surroundings in pairs.
    use {'tpope/vim-surround'}

    -- This plugin makes it possible to select
    -- things in visual mode (Shifft+v, Ctrl+v, etc)
    -- and move the selected item(s) around
    use {'atweiden/vim-dragvisuals'}

    -- Distraction-free writing in Neovim.
    use {'folke/zen-mode.nvim'}

    -- Insert or delete brackets, parens, quotes in pair.
    use {'windwp/nvim-autopairs'}

    -- Easily comment stuff out, or uncomment
    -- them out.
    use {'tpope/vim-commentary'}

    use {'kyazdani42/nvim-tree.lua'}
    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    -- Built on the latest awesome features from neovim core.
    -- Telescope is centered around modularity, allowing for easy customization.
    --
    -- INSTALL:
    -- ripgrep
    -- fd
    -- fzf
    -- required by Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use {'glepnir/dashboard-nvim'}

    -- LaTeX plugin
    use {'lervag/vimtex'}
    use {'aclements/latexrun'}

    -- Helps with ligning up text
    use {'godlygeek/tabular'}

    -- Adds icons to files/filetypes
    use {'kyazdani42/nvim-web-devicons'}

    -- You'll need to have pynvim installed,
    -- and add this plugin's path to your $PATH
    -- environment variable.
    -- Alternatively, just run
    -- sudo pip3 install neovim-remote.
    --
    -- This package provides an executable called nvr
    -- which solves these cases:
    -- * Controlling nvim processes from the shell.
    -- E.g. opening files in another terminal window.
    -- * Opening files from within :terminal without
    -- starting a nested nvim process.
    use {'mhinz/neovim-remote'}

    use {'rafamadriz/friendly-snippets'}

    use {'KeitaNakamura/tex-conceal.vim'}

    -- Floating terminal window
    use {'voldikss/vim-floaterm'}
    -- Git blame plugin
    use {'APZelos/blamer.nvim'}
    -- Only for nvim 0.5
    use {'andweeb/presence.nvim'}
    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run=function() vim.cmd(":TSUpdate") end, branch = '0.5-compat'}
    -- Monokai Theme for Neovim with tree-sitter support
    -- use {'tanvirtin/nvim-monokai'}
    -- Tokyo Night theme with tree-sitter support
    use 'folke/tokyonight.nvim'
    use 'folke/todo-comments.nvim'

    -- A snazzy buffer line (with minimal tab integration) for Neovim built using lua.
    use {'akinsho/nvim-bufferline.lua', require = 'kyazdani42/nvim-web-devicons'}
    use 'norcalli/nvim-colorizer.lua'

    use 'marko-cerovac/material.nvim'

    use 'bluz71/vim-moonfly-colors'
end)
