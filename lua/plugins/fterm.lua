local Plugin = { "numToStr/FTerm.nvim" }

function Plugin.init()
	vim.keymap.set("n", "<C-t>", "<cmd>lua require('FTerm').toggle()<CR>", {desc = "Toggle Terminal"})
	vim.keymap.set("t", "<C-t>", "<cmd>lua require('FTerm').toggle()<CR>", {desc = "Toggle Terminal"})
end

return Plugin
