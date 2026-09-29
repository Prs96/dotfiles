return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 999,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      integrations = {
        snacks = true,
        blink_cmp = true,
        which_key = true,
        mini = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
