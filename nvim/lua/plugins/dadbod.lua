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
    vim.g.db_ui_use_nerd_fonts = 1

    -- other options
    -- vim.g.db_ui_show_help = 0
    -- vim.g.db_ui_win_position = "left"
    -- vim.g.db_ui_use_nerd_fonts = 1
    -- vim.g.db_ui_winwidth = 35
    -- vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_queries"
    -- vim.g.db_ui_table_helpers = 1
    -- vim.g.db_ui_table_helpers = {
    --   postgres = {
    --     primary_key = "id",
    --     foreign_key = "id",
    --     join_table = "id",
    --   },
    -- }
  end,
}
