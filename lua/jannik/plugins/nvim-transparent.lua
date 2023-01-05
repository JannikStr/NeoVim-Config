local setup, transparent = pcall(require, "transparent")
if not setup then
	return
end

transparent.setup({
    enable = true,
    extra_groups = {
        "BufferLineTabClose",
        "BufferLineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeperator",
        "BufferLineIndicatorSelected",
        "CursorLine"
    },
    exclude = {},
});
