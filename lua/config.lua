-- relative line numbers for easier jumps
vim.opt.number = true
vim.opt.relativenumber = true

-- spilts to the bottom and to the right are more intuitive
vim.opt.splitbelow = true
vim.opt.splitright = true

-- the default tabstop of 8 spaces is too long, shorten it
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true

-- case sensitive search when query has upper case chars
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- save undo files
vim.opt.undofile = true

-- update chars used to render spaces and tabs
vim.opt.listchars = { trail = ".", space = "·", tab = "»·" }
vim.opt.list = true

-- provide some context when scrolling
vim.opt.scrolloff = 7

-- don't show completion "hit-enter" messages
vim.opt.shortmess:append("c")

-- better colours, no cursor, highlight current line
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- mouse support
vim.opt.mouse = "a"

-- faster update time
vim.opt.updatetime = 250

-- dont highlight search results
vim.opt.hlsearch = false

-- Set keywords for word splits
vim.opt.iskeyword:remove("_")

-- Dont create swapfiles
-- vim.opt.swapfile = false

-- use utf-8 by default
vim.opt.encoding = "utf-8"
