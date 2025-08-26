vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic message" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "float" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "list" })

-- Buffers and Windows
vim.keymap.set("n", "<a-b>", "<c-6>")
vim.keymap.set("n", "<a-h>", "<cmd>bp<cr>")
vim.keymap.set("n", "<a-j>", "<cmd>bf<cr>")
vim.keymap.set("n", "<a-k>", "<cmd>bl<cr>")
vim.keymap.set("n", "<a-l>", "<cmd>bn<cr>")
vim.keymap.set("n", "<a-W>", "<c-w>w")
vim.keymap.set("n", "<a-H>", "<c-w>h")
vim.keymap.set("n", "<a-J>", "<c-w>j")
vim.keymap.set("n", "<a-K>", "<c-w>k")
vim.keymap.set("n", "<a-L>", "<c-w>l")
vim.keymap.set("n", "<c-h>", "<cmd>vert res -1<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>hor res -1<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>hor res +1<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>vert res +1<cr>")
vim.keymap.set("n", "<c-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>bw<cr>")
vim.keymap.set("n", "<leader>bC", "<cmd>bd!<cr>")
vim.keymap.set("n", "<leader>bD", "<cmd>bw!<cr>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
