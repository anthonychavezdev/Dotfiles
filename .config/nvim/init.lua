-- For the Neovim VSCode plugin
if (vim.fn.exists('g:vscode') == 1)
then
    -- VSCode extensions
    vim.cmd[[source /home/anthony/.config/nvim/vscode.vim]]
else
-- Plugins
require('plugins')

-- Misc settings
require("settings")

require("keymaps")

vim.cmd(":luafile ~/.config/nvim/lua/plugin-requires.lua")

require("augroups-and-autocmds")

require("colorscheme")
-- require("custom-colors-and-highlights")

end
