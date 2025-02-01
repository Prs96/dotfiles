return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua", -- Required for Copilot
    "nvim-lua/plenary.nvim",  -- Utility functions
  },
  opts = {
    window = {
      layout = "float", -- Opens in a floating window
      width = 0.7,
      height = 0.7,
    },
  },
  cmd = "CopilotChat",
  keys = {
    { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
    { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code" },
    { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix Code" },
  },
}

