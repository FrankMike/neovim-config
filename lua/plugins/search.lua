-- Search and navigation plugins

return {
  -- FZF fuzzy finder
  {
    "junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --all",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      -- Custom Files command with proximity-sort integration
      vim.api.nvim_create_user_command("Files", function(opts)
        local base = vim.fn.fnamemodify(vim.fn.expand("%"), ":h:.:S")
        local source_cmd
        
        if base == "." then
          source_cmd = "fd -t f"
        else
          source_cmd = string.format("fd -t f | proximity-sort %s", vim.fn.expand("%"))
        end
        
        local fzf_opts = {
          source = source_cmd,
          options = "--tiebreak=index"
        }
        
        vim.fn["fzf#vim#files"](opts.args or "", fzf_opts, opts.bang)
      end, {
        bang = true,
        nargs = "?",
        complete = "dir",
        desc = "Find files with proximity sort"
      })
    end,
  },
}