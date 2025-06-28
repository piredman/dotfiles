return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'error',
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '~/Desktop' },
    }

    vim.keymap.set('n', '<leader>wr', ':SessionRestore<CR>', {
      desc = '[w]orkspace [r]estore<CR>',
    })
    vim.keymap.set('n', '<leader>ws', ':SessionSave<CR>', {
      desc = '[w]orkspace [s]ave<CR>',
    })
  end,
}
