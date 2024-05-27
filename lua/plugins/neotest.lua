return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-go',
    },
    config = function()
      local neotest_ns = vim.api.nvim_create_namespace 'neotest'
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)

      local neotest = require 'neotest'

      neotest.setup {
        adapters = { require 'neotest-go' {
          recursive_run = true,
        } },
      }

      vim.keymap.set('n', '<leader>ts', neotest.summary.toggle, { desc = '[T]est: [S]ummary' })
      vim.keymap.set('n', '<leader>tr', neotest.run.run, { desc = '[T]est: [R]un' })
    end,
  },
}
