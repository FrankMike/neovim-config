-- Miscellaneous plugins

return {
  -- Vim sensible defaults
  "tpope/vim-sensible",
  
  -- Resize windows with arrow keys
  "breuckelen/vim-resize",
  
  -- Grammar checking
  "rhysd/vim-grammarous",
  

  
  -- Markdown support
  {
    "godlygeek/tabular",
    ft = "markdown",
  },
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    dependencies = { "godlygeek/tabular" },
  },
  

}