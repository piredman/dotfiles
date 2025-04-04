-- Enable neovim to be the external editor for Godot, if the cwd has a project.godot file
if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local pipepath = vim.fn.stdpath 'cache' .. '/server.pipe'
  if not vim.loop.fs_stat(pipepath) then
    vim.fn.serverstart(pipepath)
  end
end
