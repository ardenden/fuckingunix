vim.opt.hlsearch = true
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
vim.opt.fillchars = { eob = " " }
vim.opt.inccommand = "split"
vim.opt.scrolloff = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

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

vim.diagnostic.config({ float = { border = "rounded" } })

-- for ts @Decorator
vim.api.nvim_set_hl(0, "@attribute.typescript", { link = "@operator" })
