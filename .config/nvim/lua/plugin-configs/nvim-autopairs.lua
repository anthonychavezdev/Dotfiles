require("nvim-autopairs").setup({
disable_filetype = { "TelescopePrompt", "dashboard" },
ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
enable_moveright = true,
check_ts = false,
})
