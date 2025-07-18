-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- Detect the shabang at the beginning of files to set the file type
vim.cmd [[
  augroup filetypedetect
    au! BufRead,BufNewFile * if getline(1) =~ '^#!.*\\(bash\\|sh\\)' | set filetype=sh | endif
    au! BufRead,BufNewFile * if getline(1) =~ '^#!.*\\(bun\\)' | set filetype=javascript | endif
  augroup END
]]

-- Remove trailing whitespace and keep cursor position
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    local save_cursor = vim.fn.getpos '.'
    pcall(function()
      vim.cmd [[%s/\s\+$//e]]
    end)
    vim.fn.setpos('.', save_cursor)
  end,
})
