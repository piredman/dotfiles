local M = {}

local function db_completion()
  require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
end

function M.setup()
  vim.g.db_ui_save_location = '~/.db'
  vim.g.db_ui_use_nerd_fonts = 1

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'sql',
    },
    command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'sql',
      'mysql',
      'plsql',
    },
    callback = function(event)
      vim.schedule(db_completion)

      -- remap plugin keymaps
      local map = function(mode, prev_key, next_key, func, desc)
        if prev_key then
          vim.keymap.del(mode, prev_key, { buffer = event.buf })
        end
        vim.keymap.set(mode, next_key, func, { buffer = event.buf, desc = desc })
      end

      map('n', '<leader>W', '<leader>dw', '<Plug>(DBUI_SaveQuery)', '[d]b [w]rite query')
      map('n', '<leader>E', '<leader>dp', '<Plug>(DBUI_EditBindParameters)', '[d]b edit bind [p]arameters')
      map('n', '<leader>S', '<leader>dr', '<Plug>(DBUI_ExecuteQuery)', '[d]b [r]un query')
      map('v', '<leader>S', '<leader>r', '<Plug>(DBUI_ExecuteQuery)', '[d]b [r]un query')
    end,
  })
end

return M
