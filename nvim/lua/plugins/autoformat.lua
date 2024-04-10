return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      html = { 'prettierd' },
      css = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      markdown = { 'prettierd' },
      graphql = { 'prettierd' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascrptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      cs = { 'csharpier' },
      sh = { 'shfmt' },
    },
    formatters = {
      csharpier = {
        command = 'dotnet-csharpier',
        args = { '--write-stdout' },
      },
      shfmt = {
        -- shfmt command line options
        -- https://github.com/mvdan/sh/blob/master/cmd/shfmt/shfmt.1.scd
        command = 'shfmt',
        args = { '-i', '4', '-ci' },
      },
    },
  },
  config = function()
    local conform = require 'conform'
    vim.keymap.set('n', '<leader>cf', conform.format, { desc = '[c]ode [f]ormat current file' })
  end,
}
