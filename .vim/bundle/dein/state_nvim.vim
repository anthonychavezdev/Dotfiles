if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/anthony/.config/nvim,/etc/xdg/nvim,/home/anthony/.local/share/nvim/site,/home/anthony/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/anthony/.local/share/flatpak/exports/share/nvim/site/after,/home/anthony/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/anthony/.config/nvim/after,/home/anthony/.vim,/home/anthony/.vim/after,/home/anthony/.vim/bundle/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/anthony/.vim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/anthony/.vim/bundle/dein'
let g:dein#_runtime_path = '/home/anthony/.vim/bundle/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/anthony/.vim/bundle/dein/.cache/init.vim'
let &runtimepath = '/home/anthony/.config/nvim,/etc/xdg/nvim,/home/anthony/.local/share/nvim/site,/home/anthony/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/anthony/Instantly_Better_Vim_2013/plugin/dragvisuals,/home/anthony/.vim/bundle/dein/repos/github.com/autozimu/LanguageClient-neovim,/home/anthony/.vim/bundle/dein,/home/anthony/.vim/bundle/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/anthony/.vim/bundle/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/anthony/.local/share/flatpak/exports/share/nvim/site/after,/home/anthony/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/anthony/.config/nvim/after,/home/anthony/.vim,/home/anthony/.vim/after,/home/anthony/.vim/bundle/dein/repos/github.com/Shougo/dein.vim'
filetype off