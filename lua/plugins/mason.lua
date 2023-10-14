local Plugin = {'williamboman/mason.nvim'}

Plugin.lazy = false

-- See :help mason-settings
Plugin.opts = {
  ui = {border = 'rounded'}
}

function Plugin.init()
	vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", {desc = "Mason"})
end

return Plugin

