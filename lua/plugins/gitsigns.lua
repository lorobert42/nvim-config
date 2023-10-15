local Plugin = {'lewis6991/gitsigns.nvim'}

Plugin.name = 'gitsigns'

Plugin.event = {'BufReadPre', 'BufNewFile'}

function Plugin.init()
	require("gitsigns").setup()
end

return Plugin
