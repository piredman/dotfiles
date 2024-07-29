return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add
    {
      { "<leader>c", group = "[c]ode",
        {
          "<leader>cc", group = "[c]opilot",
        }
      },
      { "<leader>d", group = "[d]atabase" },
      { "<leader>f", group = "[f]ile",
        {
          "<leader>fb", group = "[b]uffer",
        }
      },
      { "<leader>g", group = "[g]it" },
      { "<leader>h", group = "[h]arpoon" },
      { "<leader>r", group = "[r]ename" },
      { "<leader>s", group = "[s]earch" },
      { "<leader>u", group = "[u]i" },
      { "<leader>w", group = "[w]orkspace",
        {
          "<leader>wb", group = "[b]uffer",
        }
      },
    }
  end,
}
