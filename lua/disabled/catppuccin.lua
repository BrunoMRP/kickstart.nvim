return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-frappe'
    end,
    config = function()
      local cat = require 'catppuccin'
      cat.setup {
        gitsigns = true,
        treesitter = true,
        treesitter_context = true,
        mini = {
          enabled = true,
          -- indentscope_color = ""
        },
        neotree = true,
        neotest = true,
        dap = true,
        dap_ui = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        which_key = false,
      }
    end,
  },
}
