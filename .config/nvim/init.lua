vim.cmd('source ~/_vimrc')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local api = require "nvim-tree.api"

-- empty setup using defaults
require("nvim-tree").setup()

local function on_attach(bufnr)
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- custom mappings
    vim.keymap.set('n', '<s-f>j', "<cmd>Telescope find_files<cr>", { silent = true, buffer=bufnr})
    vim.keymap.set('n', '<s-f>k', "<cmd>Telescope live_grep<cr>", { silent = true, buffer=bufnr})
    vim.keymap.set('n', '<s-f>b', "<cmd>Telescope buffers<cr>", { silent = true, buffer=bufnr})
end

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },

  on_attach = on_attach,
})
