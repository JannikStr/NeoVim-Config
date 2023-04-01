local glow_setup, glow = pcall(require, "glow")
if not glow_setup then
    return
end

glow.setup({
    style="dark",
    width=120
})
