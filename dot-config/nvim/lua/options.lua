vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "auto:9"
vim.opt.relativenumber = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.scrolloff = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false
-- vim.opt.foldnestmax = 1
-- vim.opt.foldminlines = 1
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99
-- preserve folds
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- 	pattern = { "*" },
-- 	command = "normal zx",
-- })
-- vim.cmd("autocmd BufLeave *.* mkview")
-- vim.cmd("autocmd BufEnter *.* silent! loadview")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic message" })
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

vim.diagnostic.config({ float = { border = "rounded" } })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- for ts @Decorator
vim.api.nvim_set_hl(0, "@attribute.typescript", { link = "@operator" })
