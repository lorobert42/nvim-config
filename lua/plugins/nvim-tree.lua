local Plugin = {'kyazdani42/nvim-tree.lua'}

Plugin.name = 'nvim-tree'

Plugin.cmd = {'NvimTreeToggle'}

-- See :help nvim-tree-setup
Plugin.opts = {
  hijack_cursor = false,
  on_attach = function(bufnr)
    -- :help nvim-tree.api
    local api = require('nvim-tree.api')

		api.config.mappings.default_on_attach(bufnr)
  end
}

function Plugin.init()
  vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', {desc = "Explorer (root dir)"})
end

return Plugin
