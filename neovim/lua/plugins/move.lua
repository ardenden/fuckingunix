return {
	"fedepujol/move.nvim",
	config = function()
		require("move").setup({
			line = {
				enable = true, -- Enables line movement
				indent = true, -- Toggles indentation
			},
			block = {
				enable = true, -- Enables block movement
				indent = true, -- Toggles indentation
			},
			word = {
				enable = true, -- Enables word movement
				indent = true, -- Toggles indentation
			},
			char = {
				indent = true, -- Toggles indentation
				enable = true, -- Enables char movement
			},
		})

		local opts = { noremap = true, silent = true }
		vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
		vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
		vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
		vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)
	end,
}
