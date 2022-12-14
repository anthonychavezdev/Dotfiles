require("bufferline").setup({
    options = {
        view = "default",
        -- mappings = true,
        numbers = function(opts)
          return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
        buffer_close_icon= "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is deduplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
        return "("..count..")"
        end,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { "|", "|" }
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
        sort_by = "extension",
    }
})
