local Plugin = { "echasnovski/mini.indentscope" }

function Plugin.init()
	require("mini.indentscope").setup()
end

return Plugin
