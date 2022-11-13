local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	animation = false,
	auto_hide = false,
	closable = false,
	clickable = false,

	hide = { current = false, inactive = false, visible = false },
	icons = true,
	icon_separator_active = "▎",
	icon_separator_inactive = "▎",
	icon_close_tab = "",
	icon_close_tab_modified = "●",
	icon_pinned = "車",
})
