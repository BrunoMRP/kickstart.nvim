return {
  {
    'dense-analysis/ale',
    config = function()
      local g = vim.g

      g.ale_disable_lsp = 1
      g.ale_linters = {
        lua = { 'lua_language_server' },
        go = { 'gofmt', 'gofumpt', 'goimports', 'golangci-lint' },
      }
      g.ale_fixers = {
        go = { 'gofmt', 'gofumpt', 'goimports', 'golangci-lint' },
      }
    end,
  },
}
