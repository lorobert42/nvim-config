local Plugin = { "folke/todo-comments.nvim" }

Plugin.dependencies = {
	{ "nvim-lua/plenary.nvim" },
}

function Plugin.init()
	require("todo-comments").setup()
end

return Plugin
