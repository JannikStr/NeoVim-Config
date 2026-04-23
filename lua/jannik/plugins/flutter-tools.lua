local status, tools = pcall(require, "flutter-tools")
if not status then
	return
end

tools.setup {}
