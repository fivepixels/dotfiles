local keymap = vim.keymap;

local nmap = function(keys, func, desc)
  if desc then
    desc = 'Flutter: ' .. desc
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap('<leader>flr', ':FlutterRun<CR>', 'Run this project')
nmap('<leader>rr', ':FlutterRestart<CR>', 'Restart this project')

