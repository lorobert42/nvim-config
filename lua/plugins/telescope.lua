local Plugin = {'nvim-telescope/telescope.nvim'}

Plugin.branch = '0.1.x'

Plugin.dependencies = {
  {'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
}

Plugin.cmd = {'Telescope'}

function Plugin.init()
  -- See :help telescope.builtin
  vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>', {desc = "List Buffers"})
  vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {desc = "Find Files"})
  vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {desc = "Grep"})
  vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', {desc = "Diagnostics"})
end

function Plugin.config()
  require('telescope').load_extension('fzf')
end

return Plugin
