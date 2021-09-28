vim.cmd('packadd packer.nvim')         -- Load package manager

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    -- Native LSP
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}

    -- This is that bar at the bottom
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    -- Used to quickly switch colorschemes
    use {'xolox/vim-colorscheme-switcher'}
    -- Used by vim-colorscheme-switcher
    use {'xolox/vim-misc'}

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

    -- Plug 'tomtom/tlib_vim'
    -- Plug 'MarcWeber/vim-addon-mw-utils'

    use {'pangloss/vim-javascript'}

    -- ShowMarks provides a visual representation of the location marks
    -- See :help marks
    -- or, https://vim.fandom.com/wiki/Using_marks
    use {'jacquesbh/vim-showmarks'}

    -- Matches HTML tags
    use {'gregsexton/MatchTag'}

    use {'udalov/kotlin-vim'}
    use {'dracula/vim', as='dracula'}
    -- Adds syntax highlighting for gdscript3,
    -- a programing language used by the
    -- Godot game engine
    use {'calviken/vim-gdscript3'}

    -- Plug 'protesilaos/tempus-themes-vim'

    -- Easily comment stuff out, or uncomment
    -- them out.
    use {'tpope/vim-commentary'}

    -- Plug 'morhetz/gruvbox'

    use {'tpope/vim-rails'}
    use {'kyazdani42/nvim-tree.lua'}
    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    -- Built on the latest awesome features from neovim core.
    -- Telescope is centered around modularity, allowing for easy customization.
    use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}
    -- Extra syntax highlighting.
    -- I don't remember what languages this was for.
    use {'justinmk/vim-syntax-extra'}

    -- The little starting page you get when you just run
    -- (Neo)vim without any arguments
    -- use {'mhinz/vim-startify'}
    -- replacing it with Dashboard
       use {'glepnir/dashboard-nvim'}
    -- Plug 'Yggdroot/indentline'

    use {'iamcco/markdown-preview.vim'}

    -- LaTeX plugin
    use {'lervag/vimtex'}
    use {'aclements/latexrun'}

    -- Helps with ligning up text
    use {'godlygeek/tabular'}

    -- Adds icons to files/filetypes
    -- vim-devicons is stil used by
    -- startify
    use {'ryanoasis/vim-devicons'}
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

    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'rafamadriz/friendly-snippets'}

    use {'KeitaNakamura/tex-conceal.vim'}

    -- Floating terminal window
    use {'voldikss/vim-floaterm'}
    -- Git blame plugin
    use {'APZelos/blamer.nvim'}
    -- Only for nvim 0.5 Nightly
    use {'andweeb/presence.nvim'}
    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run=function() vim.cmd(":TSUpdate") end, branch = '0.5-compat'}
    -- Monokai Theme for Neovim with tree-sitter support
    -- use {'tanvirtin/nvim-monokai'}
    -- Tokyo Night theme with tree-sitter support
    use 'folke/tokyonight.nvim'
    use 'ishan9299/modus-theme-vim'  -- if using nightly neovim'
    use 'folke/todo-comments.nvim'

    -- A snazzy buffer line (with minimal tab integration) for Neovim built using lua.
    use {'akinsho/nvim-bufferline.lua', require = 'kyazdani42/nvim-web-devicons'}
    use 'norcalli/nvim-colorizer.lua'
end)
