-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim not found. Cloning...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.lazy")  -- your plugin list lives here
require("config.lsp")
require("config.treesitter")


-- Enable line numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Enable syntax highlighting (enabled by default in Neovim)
vim.cmd('syntax on')

-- Optional: Uncomment to make background dark (improves theme contrast)
-- vim.opt.background = 'dark'

-- Optional: Uncomment to enable last-position memory
-- vim.cmd [[
--   autocmd BufReadPost * if line("'\"") > 1 and line("'\"") <= line("$") |
--     \ execute "normal! g'\"" |
--   \ endif
-- ]]

-- Optional: Enable filetype-specific plugins and indent
-- vim.cmd('filetype plugin indent on')

-- Recommended quality-of-life settings (based on commented vimrc lines)
-- Uncomment or modify as needed
-- vim.opt.showcmd = true
-- vim.opt.showmatch = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
-- vim.opt.incsearch = true
-- vim.opt.autowrite = true
-- vim.opt.hidden = true
-- vim.opt.mouse = 'a'

-- 4 ident tab
vim.opt.tabstop = 4        -- Number of visual spaces per TAB
vim.opt.softtabstop = 4    -- Number of spaces inserted when hitting TAB
vim.opt.shiftwidth = 4     -- Number of spaces for each indentation
vim.opt.expandtab = true   -- Convert tabs to spaces


-- Mapping for file search
--
-- Find files including hidden ones
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references)
vim.keymap.set("n", "<leader>gi", require("telescope.builtin").lsp_implementations)
