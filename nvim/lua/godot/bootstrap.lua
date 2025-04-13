-- Enable neovim to be the external editor for Godot, if the cwd has a project.godot file
if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local pipepath = vim.fn.stdpath 'cache' .. '/server.pipe'
  if not vim.loop.fs_stat(pipepath) then
    vim.fn.serverstart(pipepath)
    vim.notify('Connected neovim as Godot external editor.', vim.log.levels.INFO)
  else
    vim.notify('Unable to connected neovim as Godot external editor.', vim.log.levels.WARN)
  end
end
