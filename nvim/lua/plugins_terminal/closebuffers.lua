return {
  {
    'kazhala/close-buffers.nvim',
    config = function()
      local cbuffers = require('close_buffers')

      cbuffers.setup({
        preserve_window_layout = { 'this' },
      })

      vim.keymap.set('n', '<leader>fbd', function()
          cbuffers.delete({type = 'this'})
        end,
        { desc = '[f]ile [b]uffers [d]elete current' }
      )

      vim.keymap.set('n', '<leader>wbd', function()
          cbuffers.delete({type = 'hidden', force = true})
        end,
        { desc = '[w]orkspace [b]uffers [d]elete hidden' }
      )

      vim.keymap.set('n', '<leader>wbn', function()
          cbuffers.delete({type = 'nameless'})
        end,
        { desc = '[w]orkspace [b]uffers [d]elete nameless' }
      )

      vim.keymap.set('n', '<leader>wbo', function()
          cbuffers.wipe({type = 'other'})
        end,
        { desc = '[w]orkspace [b]uffers delete [o]ther' }
      )
    end,
  },
}
