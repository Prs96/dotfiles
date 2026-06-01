return {
  "folke/snacks.nvim",
  priority = 950,
  keys = {
    { "<leader>e",     function() require("snacks").explorer() end,              desc = "Toggle file explorer" },
    { "<C-g>",         function() require("snacks").terminal.toggle() end,       desc = "Toggle terminal",  mode = { "n", "t" } },
    { "<leader>bc",    function() require("snacks").bufdelete() end,             desc = "Close buffer" },
    { "<leader><space>", function() require("snacks").picker("buffers") end,     desc = "Search open files" },
    { "<leader>fb",    function() require("snacks").picker("buffers") end,       desc = "Search open buffers" },
    { "<leader>ff",    function() require("snacks").picker("files") end,         desc = "Search all files" },
    { "<leader>fh",    function() require("snacks").picker("help") end,          desc = "Search help tags" },
    { "<leader>fr",    function() require("snacks").picker("recent") end,        desc = "Search file history" },
    { "<leader>fg",    function() require("snacks").picker("grep") end,          desc = "Search in project" },
    { "<leader>fd",    function() require("snacks").picker("diagnostics") end,   desc = "Search diagnostics" },
    { "<leader>fs",    function() require("snacks").picker("lines") end,         desc = "Buffer local search" },
    { "<leader>u",     function() require("snacks").picker("undo") end,          desc = "Undo history" },
    { "<leader>/",     function() require("snacks").picker("pickers") end,       desc = "Search picker" },
    { "<leader>?",     function() require("snacks").picker("keymaps") end,       desc = "Search keymaps" },
  },
  init = function()
    vim.g.snacks_animate = false
  end,
  config = function()
    require("snacks").setup({
      indent = {
        enabled = true,
        char = "▏",
      },
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
      input = {
        enabled = true,
        icon = "❯",
      },
      picker = {
        enabled = true,
        ui_select = true,
        prompt = "❯ ",
        formatters = {
          file = { truncate = 78 },
        },
      },
    })
  end,
}
