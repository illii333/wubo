-- 延迟到 VimEnter 事件后设置（所有配置加载完成）
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  end,
})

-- 或者监听 ColorScheme 事件（配色切换时触发）
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
})

-- 启用原生行号样式，禁用主题覆盖
vim.opt.number = true
vim.opt.relativenumber = false -- 关闭相对行号（减少干扰）
vim.opt.numberwidth = 4 -- 加宽行号列，避免拥挤

-- 强制行号高亮（用 Neovim 内置颜色）
vim.api.nvim_set_hl(0, "LineNr", { fg = "White", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "Magenta", bg = "NONE", bold = true })
