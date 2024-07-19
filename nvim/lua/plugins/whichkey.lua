return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add
    {
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]atabase" },
      { "<leader>f", group = "[F]ile" },
      { "<leader>g", group = "[G]it" },
      { "<leader>h", group = "[H]arpoon" },
      { "<leader>r", group = "[R]ename" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>u", group = "[U]i" },
      { "<leader>w", group = "[W]orkspace" },
    }
  end,
}
