return {
	"Diogo-ss/42-header.nvim",
	lazy = false,
	config = function()
		local header = require("42header")
		header.setup({
			default_map = true, -- default Mapping <F1> in normal mode
			auto_update = true,  -- update header when saving
			user = "lorobert", -- your user
			mail = "lorobert@student.42lausanne.ch", -- your mail
		})
	end
}
