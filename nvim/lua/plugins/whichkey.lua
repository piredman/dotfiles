return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add
    {
      { "<leader>c", group = "[C]ode" },
      { "<leader>c_", hidden = true },
      { "<leader>d", group = "[D]atabase" },
      { "<leader>d_", hidden = true },
      { "<leader>f", group = "[F]ile" },
      { "<leader>f_", hidden = true },
      { "<leader>g", group = "[G]it" },
      { "<leader>g_", hidden = true },
      { "<leader>h", group = "[H]arpoon" },
      { "<leader>h_", hidden = true },
      { "<leader>r", group = "[R]ename" },
      { "<leader>r_", hidden = true },
      { "<leader>s", group = "[S]earch" },
      { "<leader>s_", hidden = true },
      { "<leader>u", group = "[U]i" },
      { "<leader>u_", hidden = true },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>w_", hidden = true },
    }
  end,
}
