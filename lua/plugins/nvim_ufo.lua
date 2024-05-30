return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
    config = function(_, opts)
      local ufo = require 'ufo'

      -- vim.api.nvim_create_autocmd('FileType', {
      --   group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
      --   pattern = opts.filetype_exclude,
      --   callback = function()
      --     require('ufo').detach()
      --   end,
      -- })

      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.foldnestmax = 1

      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      function _G.toggle_function_folding()
        if _G.folding_enabled then
          _G.folding_enabled = false
          vim.cmd '%foldopen'
        else
          _G.folding_enabled = true
          vim.cmd '%foldclose'
        end
      end
      vim.api.nvim_set_keymap('n', 'zi', [[<Cmd>lua _G.toggle_function_folding()<CR>]], { noremap = true, silent = false })

      ufo.setup(opts)
    end,
  },
}
