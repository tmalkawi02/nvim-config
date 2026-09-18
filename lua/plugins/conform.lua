return {
	"stevearc/conform.nvim",
	name = "formatter",
	tag = "v9.0.0",
	keys = {
		{
			"<C-f>",
			function()
				require("conform").format({
					bufnr = vim.api.nvim_get_current_buf(),
				})
			end,
			desc = "Prettify a file",
		},
	},
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			json = { "prettier", "prettierd", "fixjson" },
			jsonc = { "fixjson" },
			typescript = { "prettier", "prettierd" },
			cpp = { "clang-format" },
			sql = { "sql_formatter" },
		},
		formatters = {
			sql_formatter = {
				inherit = false,
				command = "sql-formatter",
				args = { "--config", ".sql-formatter.json" },
			},
		},
		notify_on_error = true,
	},
}
