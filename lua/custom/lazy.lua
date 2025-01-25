local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Colorscheme
  "ellisonleao/gruvbox.nvim",

  -- Treesitter Context
  "nvim-treesitter/nvim-treesitter-context",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Themery
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "Gruvbox dark",
            colorscheme = "gruvbox",
            before = [[vim.opt.background = "dark"]],
          },
          {
            name = "Gruvbox light",
            colorscheme = "gruvbox",
            before = [[vim.opt.background = "light"]],
          },
          {
            name = "Turbo C",
            colorscheme = "blue",
          },
          {
            name = "Turbo C if it was good",
            colorscheme = "darkblue",
          },
          {
            name = "Laboratory",
            colorscheme = "default",
            before = [[vim.opt.background = "light"]],
          },
          {
            name = "Lab night",
            colorscheme = "default",
            before = [[vim.opt.background = "dark"]],
          },
          {
            name = "BadTurboC",
            colorscheme = "delek",
          },
          {
            name = "Desert",
            colorscheme = "desert",
          },
          {
            name = "Beetroot",
            colorscheme = "elflord",
          },
          {
            name = "Evening",
            colorscheme = "evening",
          },
          {
            name = "DarkForest",
            colorscheme = "habamax",
          },
          {
            name = "Beetroot2",
            colorscheme = "industry",
          },
          {
            name = "KindaBasic",
            colorscheme = "koehler",
          },
          {
            name = "BasicButBetter",
            colorscheme = "lunaperche",
          },
          {
            name = "MyEyesPleaseSTop",
            colorscheme = "morning",
          },
          {
            name = "Carrots",
            colorscheme = "murphy",
          },
          {
            name = "Ocean",
            colorscheme = "pablo",
          },
          {
            name = "KristalPinkTeddyBear",
            colorscheme = "peachpuff",
          },
          {
            name = "LossOfColor",
            colorscheme = "quiet",
          },
          {
            name = "Gruvbox-0.9",
            colorscheme = "retrobox",
            before = [[vim.opt.background = "dark"]],
          },
          {
            name = "Gruvbox-0.9-light",
            colorscheme = "retrobox",
            before = [[vim.opt.background = "light"]],
          },
          {
            name = "Hacker1",
            colorscheme = "ron",
          },
          {
            name = "PainfulSnow",
            colorscheme = "shine",
          },
          {
            name = "SapphireOre",
            colorscheme = "slate",
          },
          {
            name = "EvilCarrot(BadHighlighting)",
            colorscheme = "sorbet",
          },
          {
            name = "BasicAgain",
            colorscheme = "torte",
          },
          {
            name = "BasicNoBG(BitPainful)",
            colorscheme = "vim",
          },
          {
            name = "WildFlower",
            colorscheme = "wildcharm",
          },
          {
            name = "CoolPurple",
            colorscheme = "zaibatsu",
          },
          {
            name = "EyePain",
            colorscheme = "zellner",
          },
        },
      })
    end,
  },
})

