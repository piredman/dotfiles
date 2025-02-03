return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[c]ode [f]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
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
}
