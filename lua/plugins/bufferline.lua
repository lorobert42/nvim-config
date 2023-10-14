local Plugin = {'akinsho/bufferline.nvim' }

Plugin.name = 'bufferline'

Plugin.event = 'VeryLazy'

Plugin.opts = {
  options = {
		always_show_bufferline = false,
    mode = 'buffers',
    offsets = {
      {filetype = 'NvimTree'}
    },
  },
  -- :help bufferline-highlights
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
}

return Plugin
