return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    sources = {
      'filesystem',
      -- 'buffers',
      'git_status',
      'document_symbols',
    },
    source_selector = {
      winbar = true,
      statusline = false,
      sources = {
        { source = 'filesystem' },
        -- { source = 'buffers' },
        { source = 'git_status' },
        { source = 'document_symbols' },
      },
    },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      bind_to_cwd = false,
      filtered_items = {
        visible = true,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
