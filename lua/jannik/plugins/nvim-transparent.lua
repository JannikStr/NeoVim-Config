local setup, transparent = pcall(require, "transparent")
if not setup then
	return
end

transparent.setup({
    extra_groups = {
        "BufferLineTabClose",
        "BufferLineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeperator",
        "BufferLineIndicatorSelected",
        "CursorLine",
        "TelescopeBorder",
        "TelescopePreviewNormal",
        "TelescopePromptNormal",
        "TelescopeResultsNormal"
    },
    exclude_groups = {},
});
