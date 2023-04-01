local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	animation = false,
	auto_hide = false,
	clickable = false,

	hide = { current = false, inactive = false, visible = false },
	icons = {
        filetype = {
            enabled = true
        },
        inactive = {
            seperator = {
                left = "▎"
            }
        },
        button = "",
        modified = {
            button = "●"
        },
        pinned = {
            button = "車"
        },
        seperator = {
            left = "▎"
        }
    },
})
