return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "BurntSushi/ripgrep" },
		{ "nvim-lua/plenary.nvim" },
		{ "sharkdp/fd" },
	},
	keys = function(_, keys)
		keys = keys or {}
		local telescope = require("telescope.builtin")
		return vim.tbl_deep_extend("force", keys, {
			{ "<leader>ff", telescope.find_files, desc = "Telescope find files" },
			{ "<leader>fg", telescope.live_grep, desc = "Telescope live grep" },
			{ "<leader>fb", telescope.buffers, desc = "Telescope buffers" },
			{ "<leader>fh", telescope.help_tags, desc = "Telescope help tags" },
			{ "<leader>gd", telescope.lsp_references, desc = "Telescope Object References" },
			{ "<leader>gi", telescope.lsp_implementations, desc = "Telescope lsp Implementation" },
		})
	end,
}
