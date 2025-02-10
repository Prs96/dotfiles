-- lua/custom/plugins/mini.lua
return {
	{
		"echasnovski/mini.nvim",
		enabled = true,
		config = function()
			local statusline = require("mini.statusline")
			local files = require("mini.files")
			statusline.setup({ use_icons = true })
			files.setup()
		end,
	},
}
