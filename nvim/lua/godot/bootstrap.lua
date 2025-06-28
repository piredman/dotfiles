-- In Godot setup an external editor
-- Editor > Editor Settings :: Text Editor > External
-- Exec Path: nvim
-- Exec Flags: --server /home/$USER/.cache/nvim/server.pipe --remote-send "<C-\><C-N>:e {file}<CR>{line}G{col}|"
--   replace $USER with your actual username
-- Use External Editor: On

if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local pipepath = vim.fn.stdpath 'cache' .. '/server.pipe'
  if not vim.loop.fs_stat(pipepath) then
    vim.fn.serverstart(pipepath)
    vim.notify('Connected neovim as Godot external editor.', vim.log.levels.INFO)
  else
    vim.notify('Unable to connected neovim as Godot external editor.', vim.log.levels.WARN)
  end
end

vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.gd',
  callback = function()
    vim.bo.filetype = 'gdscript'
  end,
})
