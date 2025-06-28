return {
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      require('harpoon').setup {
        menu = {
          width = (function()
            local ok, width = pcall(function()
              return vim.api.nvim_win_get_width(0) / 2
            end)
            return (ok and width > 0) and width or 60
          end)(),
        },
      }

      vim.keymap.set('n', '<leader>hl', ui.toggle_quick_menu, { desc = '[h]arpoon [l]ist files' })
      vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = '[h]arpoon [a]dd file' })

      local function nav_next()
        ui.nav_next()
      end
      vim.keymap.set('n', '<leader>hn', nav_next, { desc = '[h]arpoon [n]ext file' })
      vim.keymap.set('n', '<A-n>', nav_next)

      local function nav_prev()
        ui.nav_next()
      end
      vim.keymap.set('n', '<leader>hp', nav_prev, { desc = '[h]arpoon [p]revious file' })
      vim.keymap.set('n', '<A-p>', nav_prev)

      local function nav_file_1()
        ui.nav_file(1)
      end
      vim.keymap.set('n', '<leader>h1', nav_file_1, { desc = '[h]arpoon [1]st file' })
      vim.keymap.set('n', '<A-h>', nav_file_1)

      local function nav_file_2()
        ui.nav_file(2)
      end
      vim.keymap.set('n', '<leader>h2', nav_file_2, { desc = '[h]arpoon [2]nd file' })
      vim.keymap.set('n', '<A-j>', nav_file_2)

      local function nav_file_3()
        ui.nav_file(3)
      end
      vim.keymap.set('n', '<leader>h3', nav_file_3, { desc = '[h]arpoon [3]rd file' })
      vim.keymap.set('n', '<A-k>', nav_file_3)

      local function nav_file_4()
        ui.nav_file(4)
      end
      vim.keymap.set('n', '<leader>h4', nav_file_4, { desc = '[h]arpoon [4]th file' })
      vim.keymap.set('n', '<A-l>', nav_file_4)
    end,
  },
}
