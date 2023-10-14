local Plugin = { "kdheepak/lazygit.nvim" }

Plugin.dependencies = {
	"nvim-lua/plenary.nvim",
}

Plugin.cmd = {"LazyGit"}

function Plugin.init()
	vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', {desc = 'LazyGit (root dir)'})
	vim.keymap.set('n', '<leader>gG', '<cmd>LazyGitCurrentFile<CR>', {desc = 'LazyGit (cwd)'})
end

function Plugin.config()
	require("telescope").load_extension("lazygit")
end

return Plugin
