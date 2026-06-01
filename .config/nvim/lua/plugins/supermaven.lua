return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  cmd = {
    "SupermavenStart",
    "SupermavenStop",
    "SupermavenRestart",
    "SupermavenToggle",
    "SupermavenStatus",
    "SupermavenUseFree",
    "SupermavenUsePro",
    "SupermavenLogout",
    "SupermavenShowLog",
    "SupermavenClearLog",
  },
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<M-y>",
        accept_word = "<M-w>",
        clear_suggestion = "<M-]>",
      },
    })
  end,
}
