return {
  "echasnovski/mini.nvim",
  lazy = false,
  config = function()
    vim.o.showmode = false
    require("mini.statusline").setup({ use_icons = true })
    require("mini.comment").setup({})
    require("mini.snippets").setup({})
    require("mini.git").setup({})
    require("mini.diff").setup({
      view = {
        style = "sign",
        signs = {
          add = "▎",
          change = "▎",
          delete = "➤",
        },
      },
    })
    require("mini.icons").setup({ style = "glyph" })
    require("mini.notify").setup({
      lsp_progress = {
        enable = false,
      },
    })
  end,
}
