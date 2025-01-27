return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- tmux vim
  'christoomey/vim-tmux-navigator',

  -- word wrap
  'preservim/vim-pencil',

  -- hex colour display
  {
      "catgoose/nvim-colorizer.lua",
      event = "BufReadPre",
      opts = { -- set to setup table
      },
  },

  require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
}
