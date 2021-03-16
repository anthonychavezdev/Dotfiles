" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  MatchTag = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/MatchTag"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["blamer.nvim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  dracula = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/dracula"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/kotlin-vim"
  },
  latexrun = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/latexrun"
  },
  ["markdown-preview.vim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/markdown-preview.vim"
  },
  ["neovim-remote"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/neovim-remote"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  tabular = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/tabular"
  },
  tagbar = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/tex-conceal.vim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-colorscheme-switcher"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-colorscheme-switcher"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dragvisuals"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-dragvisuals"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-gdscript3"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-gdscript3"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-showmarks"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-showmarks"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-syntax-extra"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-syntax-extra"
  },
  ["vim-trailing-whitespace"] = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vim-trailing-whitespace"
  },
  vimtex = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  vimwiki = {
    loaded = true,
    path = "/home/anthony/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
