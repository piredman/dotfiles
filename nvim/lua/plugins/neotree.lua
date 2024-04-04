return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      use_libuv_file_watcher = true,
    }

    vim.keymap.set('n', '<leader>fe', ':Neotree filesystem toggle left<CR>', {
      desc = '[f]ile [e]xplorer<CR>',
    })
    vim.keymap.set('n', '<leader>fr', ':Neotree filesystem toggle left reveal<CR>', {
      desc = '[f]ile [r]eveal<CR>',
    })
  end,
}
