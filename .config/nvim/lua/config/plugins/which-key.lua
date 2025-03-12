return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>w", "<CMD>WhichKey<CR>", { noremap = true, silent = true, desc = "Open WhichKey" })
	end,
	opts = {},
}
