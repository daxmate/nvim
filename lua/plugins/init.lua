require("plugins.packer")

local ok, _ = pcall(require, "plugins.settings")
if not ok then return end

