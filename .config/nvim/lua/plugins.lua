vim.cmd('packadd packer.nvim')         -- Load package manager

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    -- Native LSP
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}

    -- This is that bar at the bottom
    use {'glepnir/galaxyline.nvim', branch='main'}

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

    -- VimWiki is a personal wiki for Vim -- a number of linked text files
    -- that have their own syntax highlighting
    --
    -- With VimWiki you can:

    -- Organize notes and ideas
    -- Manage to-do lists
    -- Write documentation
    -- Maintain a diary
    -- Export everything to HTML
    use {'vimwiki/vimwiki'}

    -- This plugin makes it possible to select
    -- things in visual mode (Shifft+v, Ctrl+v, etc)
    -- and move the selected item(s) around
    use {'atweiden/vim-dragvisuals'}

    -- Distraction-free writing in Vim.
    use {'junegunn/goyo.vim'}

    -- Insert or delete brackets, parens, quotes in pair.
    use {'jiangmiao/auto-pairs'}

    -- Plug 'tomtom/tlib_vim'
    -- Plug 'MarcWeber/vim-addon-mw-utils'

    use {'pangloss/vim-javascript'}

    -- Plug 'ervandew/supertab'
    use {'rust-lang/rust.vim'}

    -- ShowMarks provides a visual representation of the location marks
    -- See :help marks
    -- or, https://vim.fandom.com/wiki/Using_marks
    use {'jacquesbh/vim-showmarks'}

    -- Tagbar is a Vim plugin that provides an easy way to browse the tags
    -- of the current file and get an overview of its structure
    -- bringing up tagbar shows you variables, and function names
    -- on a side panel, and allows you to quickly jump to them
    use {'majutsushi/tagbar'}

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

    use {'KeitaNakamura/tex-conceal.vim'}

    -- Floating terminal window
    use {'voldikss/vim-floaterm'}
    -- Git blame plugin
    use {'APZelos/blamer.nvim'}
    -- Only for nvim 0.5 Nightly
    use {'andweeb/presence.nvim'}
    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run=function() vim.cmd(":TSUpdate") end}
    -- Monokai Theme for Neovim with tree-sitter support
    -- use {'tanvirtin/nvim-monokai'}
    -- Tokyo Night theme with tree-sitter support
    use 'folke/tokyonight.nvim'
    use 'folke/todo-comments.nvim'
end)
