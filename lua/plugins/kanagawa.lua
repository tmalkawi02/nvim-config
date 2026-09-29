return {
	"rebelot/kanagawa.nvim",
	priority = 4000,
	lazy = false,

	opts = {
		compile = false,
		undercurl = false,
		commenStyle = { italic = true },
		functionStyle = {},
		statementStyle = { bold = false },
		typeStyle = {},
		keywordStyle = {},
		transparent = false,
		dimInactive = false,
		terminalColors = true,
		theme = "wave",
		background = {
			dark = "wave",
			light = "lotus",
		},
		colors = {
			wave = {
				ui = {
					float = {
						bg = "none",
					},
				},
			},
		},
	},
	config = true,
}
