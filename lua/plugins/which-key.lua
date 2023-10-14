local Plugin = { "folke/which-key.nvim" }

Plugin.event = "VeryLazy"

Plugin.opts = {
	plugins = { spelling = true },
	defaults = {
		mode = { "n", "v" },
		["<leader>b"] = { name = "+buffer" },
		["<leader>c"] = { name = "+code" },
		["<leader>f"] = { name = "+file/find" },
		["<leader>g"] = { name = "+git" },
	},
}

function Plugin.init()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

function Plugin.config()
	local wk = require("which-key")
	wk.setup(Plugin.opts)
	wk.register(Plugin.opts.defaults)
end

return Plugin
