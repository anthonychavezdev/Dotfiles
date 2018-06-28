if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/anthony/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/home/anthony/.vim/after,/home/anthony/.vim/bundle/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/anthony/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/anthony/.vim/bundle/dein'
let g:dein#_runtime_path = '/home/anthony/.vim/bundle/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/anthony/.vim/bundle/dein/.cache/.vimrc'
let &runtimepath = '/home/anthony/.vim,/usr/share/vim/vimfiles,/home/anthony/Instantly_Better_Vim_2013/plugin/dragvisuals,/home/anthony/.vim/bundle/dein/repos/github.com/autozimu/LanguageClient-neovim,/home/anthony/.vim/bundle/dein,/home/anthony/.vim/bundle/dein/.cache/.vimrc/.dein,/usr/share/vim/vim81,/home/anthony/.vim/bundle/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/anthony/.vim/after,/home/anthony/.vim/bundle/dein/repos/github.com/Shougo/dein.vim'
filetype off
