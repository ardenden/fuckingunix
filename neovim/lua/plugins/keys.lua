return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- Sets the loading event to 'VimEnter'
	opts = {
		preset = "classic",
	},
	keys = {
		{ "<leader>g", "", desc = "git", mode = { "n", "v" } },
		{ "<leader>f", "", desc = "find" },
		{ "<leader>s", "", desc = "search" },
		{ "<leader>l", "", desc = "lsp" },
		{ "<leader>w", "", desc = "workspace" },
		{ "<leader>d", "", desc = "diagnostics" },
		{ "<leader>b", "", desc = "buffer" },
	},
}
