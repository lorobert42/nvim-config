local Plugin = { "catppuccin/nvim" }

Plugin.name = "catppuccin"

Plugin.priority = 1000

Plugin.opts = {
	integrations = {
		alpha = true,
		cmp = true,
		gitsigns = true,
		mason = true,
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
		nvimtree = true,
		treesitter = true,
	},
}

return Plugin
