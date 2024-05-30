return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Mini Starter
      require('mini.starter').setup()

      require('mini.notify').setup()

      -- Mini Map
      local map = require 'mini.map'
      map.setup {
        integrations = {
          map.gen_integration.builtin_search(),
          -- map.gen_integration.diff(),
          map.gen_integration.diagnostic(),
          map.gen_integration.gitsigns(),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot '3x2',
        },
        window = {
          focusable = true,

          -- Set this to the maximum width of your scroll symbols
          -- width = 1,

          -- Set this to your liking. Try values 0, 25, 50, 75, 100
          winblend = 50,

          show_integration_count = true,
        },
      }

      -- Mini comment
      -- gc/gcc to toggle comments in various modes
      require('mini.comment').setup()

      -- Mini Move
      -- Alt + Movement Keys to move text
      require('mini.move').setup()

      -- Better Around/Inside textobjects
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          F = spec_treesitter { a = '@function.outer', i = '@function.inner' },
          o = spec_treesitter {
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          },
        },
      }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Mini Jump
      -- f/F/t/T across lines
      require('mini.jump').setup()

      -- Mini diff
      require('mini.diff').setup()

      -- Mini Pairs
      -- Autocompletion for paired chars
      require('mini.pairs').setup()

      -- Mini tabline
      -- require('mini.tabline').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
