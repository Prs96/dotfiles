return {
  "VonHeikemen/ts-enable.nvim",
  version = "v2.x",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.g.ts_enable = {
      auto_init = true,
      auto_install = true,
      highlights = true,
    }
  end,
}
