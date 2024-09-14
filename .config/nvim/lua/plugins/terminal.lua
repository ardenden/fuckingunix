return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		shell = "/usr/bin/zsh",
	},
	vim.keymap.set({ "i", "n", "t" }, "<c-\\>", "<cmd>ToggleTerm direction=float<cr>"),
}
