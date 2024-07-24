return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- default save location: ~/.local/share/db_ui
    -- vim.g.db_ui_save_location = '~/.db/dadbod_queries'
    vim.g.db_ui_use_nerd_fonts = 1

    -- other options
    -- vim.g.db_ui_show_help = 0
    -- vim.g.db_ui_win_position = "left"
    -- vim.g.db_ui_winwidth = 35
    -- vim.g.db_ui_table_helpers = 1
    -- vim.g.db_ui_auto_execute_table_helpers = 1
    -- vim.g.db_ui_table_helpers = {
    --   postgres = {
    --     primary_key = "id",
    --     foreign_key = "id",
    --     join_table = "id",
    --   },
    -- }

    vim.keymap.set('n', '<leader>de', ':DBUIToggle<CR>', {
      desc = '[d]atabase [e]xplore',
    })

    -- remap plugin keymaps
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'sql' },
      callback = function(event)
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
  end,
}
