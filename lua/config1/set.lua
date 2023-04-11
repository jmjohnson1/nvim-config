-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Use relative line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- Enable the mouse
--vim.o.mouse = 'a' 

-- Enable break indent ( preserves indenting )
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching unless /C or capital insearch
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorsheme
vim.o.termguicolors = true


-- Improve completion
vim.o.completeopt = 'menuone,noselect'

-- Set the tab width and shift width
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Setup text wrapping at 100 characters
vim.o.textwidth = 100

