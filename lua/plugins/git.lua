-- Git integration plugins

return {
  -- Git commands
  "tpope/vim-fugitive",
  
  -- Modern git interface
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neogit").setup({})
    end,
  },
  
  -- Required dependency for neogit
  "nvim-lua/plenary.nvim",
}