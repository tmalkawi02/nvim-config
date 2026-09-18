local status, conform = pcall(require, "conform")
if not status then
	return print(string.format("Error: Failed to load conform with status: %q", status))
end

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua", "*.cpp", "*.ts", "*.sql" },
	callback = function(args)
		conform.format({ bufnr = args.buf })
	end,
})
