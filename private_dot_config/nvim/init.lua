-- Disable the included and unused file manager
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.mouse = { a = true }
vim.opt.numberwidth = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.relativenumber = true
vim.opt.showmode = false
-- Nvim usually enables this for us, but since we load nvim-colorizer before
-- that happens, enable it manually
vim.opt.termguicolors = true

-- Ignore case unless the first letter is uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indent with 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Set up keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
-- Redo
vim.keymap.set("n", "U", "<C-r>")

-- Setup plugins with vim.pack
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/romus204/tree-sitter-manager.nvim",
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/windwp/nvim-autopairs",
    -- Auto create parent dirs
    "https://github.com/mateuszwieloch/automkdir.nvim",
    -- Automark colors (#123456)
    "https://github.com/catgoose/nvim-colorizer.lua",
    -- Autoremove search highlights when appropiate
    "https://github.com/nvimdev/hlsearch.nvim",
    -- Remove trailing whitespace and newlines
    "https://github.com/cappyzawa/trim.nvim",
    -- Automatically detect and use indentation from file
    "https://github.com/nmac427/guess-indent.nvim",
    -- Provide hints for quicker nvim user
    "https://github.com/m4xshen/hardtime.nvim",
    -- UI library dependency for hardtime
    "https://github.com/MunifTanjim/nui.nvim",
    -- Highlight arguments in functions (requires tree-sitter)
    "https://github.com/m-demare/hlargs.nvim"
})

-- Initial setup for basic plugins
require("lualine").setup()
require("nvim-autopairs").setup()
require("automkdir").setup()
require("colorizer").setup()
require("hlsearch").setup()
require("trim").setup()
require("guess-indent").setup()
require("hardtime").setup({
    disabled_keys = {
      ["<Up>"] = { "" },
      ["<Down>"] = { "" },
      ["<Left>"] = { "" },
      ["<Right>"] = { "" },
   },
})
require("tree-sitter-manager").setup({
    auto_install = true
})
require("hlargs").setup()

-- Setup for other plugins
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = { "italic" },
        strings = { "italic" },
        variables = { "italic" },
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
})

require("nvim-tree").setup({
    disable_netrw = true,
    git = {
        enable = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        number = true,
        relativenumber = true,
        width = 40,
        side = "left",
    },
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
        },
    },
})

vim.cmd.colorscheme "catppuccin"
