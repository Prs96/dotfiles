require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<space>e", ":lua MiniFiles.open()<CR>", { desc = "Open file" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
local job_id = 0
vim.keymap.set("n", "<space>to", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)

	job_id = vim.bo.channel
end)
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.pdf",
	callback = function()
		local pdf_file = vim.fn.expand("%:p") -- Get full PDF path
		local cmd = "pdftotext -layout " .. vim.fn.shellescape(pdf_file) .. " -" -- Properly escape filename
		local output = vim.fn.systemlist(cmd) -- Run command and capture output

		-- Check if `pdftotext` failed
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_err_writeln("Error running pdftotext on: " .. pdf_file)
			return
		end

		-- Replace buffer content with extracted text
		vim.api.nvim_buf_set_lines(0, 0, -1, false, output)
		vim.bo.filetype = "txt" -- Set buffer filetype to text
	end,
})
