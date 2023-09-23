local go_setup, go = pcall(require, "go")
if not go_setup then
    return
end

go.setup()

