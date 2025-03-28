return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    vim.keymap.set('n', '<leader>gs', neogit.open, {
      desc = '[g]it [s]tatus',
    })

    vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', {
      desc = '[g]it [b]ranches',
    })

    vim.keymap.set('n', '<leader>gB', ':G blame_line<CR>', {
      desc = '[g]it [B]lame line',
    })
  end,
}
