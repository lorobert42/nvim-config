local Plugin = {'neovim/nvim-lspconfig'}
local user = {}

Plugin.dependencies =  {
  {'hrsh7th/cmp-nvim-lsp'},
  {'williamboman/mason-lspconfig.nvim'},
}

Plugin.cmd = {'LspInfo', 'LspInstall', 'LspUnInstall'}

Plugin.event = {'BufReadPre', 'BufNewFile'}

function Plugin.init()
  local sign = function(opts)
    -- See :help sign_define()
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({name = 'DiagnosticSignError', text = '✘'})
  sign({name = 'DiagnosticSignWarn', text = '▲'})
  sign({name = 'DiagnosticSignHint', text = '⚑'})
  sign({name = 'DiagnosticSignInfo', text = '»'})

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
      border = 'rounded',
      source = 'always',
    },
  })

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
  )
end

function Plugin.config()
  -- See :help lspconfig-global-defaults
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config

  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  local group = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})

  vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    desc = 'LSP actions',
    callback = user.on_attach
  })

  -- See :help mason-lspconfig-settings
  require('mason-lspconfig').setup({
    ensure_installed = {
      'eslint',
      'tsserver',
      'html',
      'cssls',
      'lua_ls',
			'clangd',
			'rust_analyzer',
    },
    handlers = {
      -- See :help mason-lspconfig-dynamic-server-setup
      function(server)
        -- See :help lspconfig-setup
        lspconfig[server].setup({})
      end,
      ['tsserver'] = function()
        lspconfig.tsserver.setup({
          settings = {
            completions = {
              completeFunctionCalls = true
            }
          }
        })
      end,
      ['lua_ls'] = function()
        require('plugins.lsp.lua_ls')
      end
    }
  })
end

function user.on_attach()
  local bufmap = function(mode, lhs, rhs, desc)
    local opts = {buffer = true, desc = desc}
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- You can search each function in the help page.
  -- For example :help vim.lsp.buf.hover()

  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', "Hover")
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', "Goto Definition")
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', "Goto Declaration")
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', "Goto Implementation")
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Goto Type Definition")
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', "References")
  bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', "Signature Help")
  bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', "Rename")
  bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', "Format")
  bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', "Code Action")
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', "Diagnostic Float")
  bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', "Prev Diagnostic")
  bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', "Next Diagnostic")
end

return Plugin

