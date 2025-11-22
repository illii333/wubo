return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      flavor = "mocha",
      -- 强制所有组件透明
      custom_highlights = {
        Normal = { bg = "none" },
        NormalFloat = { bg = "none" },
        NeoTreeNormal = { bg = "none" },
        TelescopeNormal = { bg = "none" },
        LineNr = { fg = "#ffffff", bg = "none" },
        CursorLineNr = { fg = "#cba6f7", bg = "none" },
      },
    })
    vim.cmd.colorscheme("catppuccin")
    -- 最后强制设置一次
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  end,
}
