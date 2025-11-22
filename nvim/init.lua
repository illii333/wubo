-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 强制设置行号颜色，不管任何主题/插件
vim.cmd([[
  hi LineNr guifg=#ffffff guibg=NONE ctermfg=white ctermbg=NONE
  hi CursorLineNr guifg=#ff00ff guibg=NONE ctermfg=magenta ctermbg=NONE
]])
