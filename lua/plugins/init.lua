-- Plugin specifications entry point

return {
  -- Colorschemes
  {
    "morhetz/gruvbox",
    lazy = true,
  },
  {
    "tpope/vim-vividchalk",
    lazy = true,
  },
  {
    "TroyFletcher/vim-colors-synthwave",
    lazy = true,
  },
  {
    "kenwheeler/glow-in-the-dark-gucci-shark-bites-vim",
    lazy = true,
  },
  {
    "sainnhe/edge",
    priority = 1000,
    config = function()
      if vim.fn.has("termguicolors") == 1 then
        vim.opt.termguicolors = true
      end
      
      vim.g.edge_style = "neon"
      vim.g.edge_enable_italic = 1
      vim.g.edge_disable_italic_comment = 1
      vim.g.edge_cursor = "purple"
      
      vim.cmd("colorscheme edge")
    end,
  },

  -- Vim defaults
  "tpope/vim-sensible",

  -- Resize screen using arrow keys
  "breuckelen/vim-resize",

  -- Git support
  "nvim-lua/plenary.nvim",
  "tpope/vim-fugitive",
  "TimUntersberger/neogit",



  -- Check english grammar
  "rhysd/vim-grammarous",

  -- Markdown support
  "godlygeek/tabular",
  "plasticboy/vim-markdown",



  -- Fzf search
  {
    "junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --all",
  },
  "junegunn/fzf.vim",
}