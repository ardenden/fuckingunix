return {
	"Mofiqul/vscode.nvim",
	config = function()
		require("vscode").setup({
			italic_comments = true,
			underline_links = true,
		})
		vim.cmd.colorscheme("vscode")
	end,
}
