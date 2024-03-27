-- SQL Server ~
-- >
--     sqlserver://[<user>[:<password>]@][<host>][:<port>]/[<database>]
--     sqlserver://[<host>[:<port>]][;user=<user>][;...]
-- <
-- Supported query parameters are `authentication`, `secure` and `trustServerCertificate`,
-- which correspond to connection properties of the same name. The `authentication`
-- property is only supported when using `go-sqlcmd`.
--
-- To set the `integratedSecurity` connection property and use a trusted
-- connection, omit the user and password.

return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
  },
  config = function()
    -- TODO: Enable database plugin once I can merge it with other cmp sources
    -- require('custom.config.dadbod').setup()

    vim.keymap.set('n', '<leader>de', ':DBUIToggle<CR>', {
      desc = '[d]atabase [e]xplore',
    })
  end,
}
