-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
-- init.lua or plugins.lua
require('lazy').setup {
  spec = {
    -- plugins that should always be enabled
    { import = 'plugins', cond = true },
    -- plugins that should only be enabled inside the terminal
    {
      import = 'plugins_terminal',
      cond = function()
        return not vim.g.vscode
      end,
      priority = 1000,
    },
    -- plugins that should only be enabled inside vscode, or vscode based editors
    {
      import = 'plugins_vscode',
      cond = function()
        return vim.g.vscode
      end,
      priority = 2000,
    },
  },
  {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
      },
    },
  },
}
