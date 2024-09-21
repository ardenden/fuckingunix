return {
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup({
			preset = "classic",
		})

		-- document existing key chains
		require("which-key").add({
			{ "<leader>g", group = "git" },
			{ "<leader>f", group = "find" },
			{ "<leader>s", group = "search" },
			{ "<leader>l", group = "lsp" },
			{ "<leader>w", group = "workspace" },
			{ "<leader>d", group = "diagnostics" },
			{ "<leader>b", group = "buffer" },

			{ "<leader>", name = "NORMAL", mode = "n" },
			{ "<leader>", name = "VISUAL", mode = "v" },
			{ "<leader>g", group = "git", mode = "v" },
		})
	end,
}
