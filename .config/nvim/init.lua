-- ~~Don't~~ Stop me now

-- leaderKey = <space>
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- OPTIONS
vim.opt.number         = true -- enableLineNumbers
vim.opt.relativenumber = true -- generalTheoryOfRelativity
vim.opt.tabstop        = 3 -- howFatTabCanBe?3kgs
vim.opt.shiftwidth     = 3 -- 3steps...IMeanSpaces
vim.opt.expandtab      = true -- usesSpacesInsteadOfTabs
vim.opt.smartindent    = true -- justWhatItSays
vim.opt.wrap           = true -- enableLineWrap
vim.opt.termguicolors  = true -- betterColors
vim.opt.cursorline     = true -- highlightCurrentLine
vim.opt.clipboard      = "unnamedplus" -- tmux + nvim = weird

-- SHORTCUTS
vim.keymap.set("n", "<leader>e", ":Ex<CR>") -- fileExplorer
vim.keymap.set("n", "<leader>w", ":w<CR>") -- save
vim.keymap.set("n", "<leader>q", ":q<CR>") -- quit
vim.keymap.set("n", "<leader>wq", ":wq<CR>") -- save n quit
vim.keymap.set("n", "<leader>f", function()
vim.lsp.buf.format()
end, { desc = "Format file" }) -- format

-- I'm LAZY.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- EXTENSIONS... OR PLUGINS
require("lazy").setup({

  -- statusLine
  { "nvim-lualine/lualine.nvim", config = true },

  -- syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- finder (fuzzy search)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- fileExplorer
  { "nvim-tree/nvim-tree.lua" },

  -- Mason (manages external tools like LSP/formatters)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason + LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" }, -- auto-install Python LSP
      })
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
    end,
  },

  -- Python formatting via black
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black, -- needs "pip install black"
        },
      })
    end,
  },
})

-- make sure npm is installed in your system!!!
