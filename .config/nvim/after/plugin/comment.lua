local status, comment = pcall(require, "comment")
if (not status) then
  print("comment is not installed.")
  return
end

comment.setup {
  pre_hook = function(ctx)
    if vim.bo.filetype == 'typescriptreact' then
      local U = require("Comment.utils")
      local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'
      local location = nil

      if ctx.ctype == U.ctype.blockwise then
        location = require('ts_context_commentstring.utils').getcursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = type,
        location = location
      })
    end
  end
}
