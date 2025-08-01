-- Autocommands configuration

local M = {}

function M.setup()
  local augroup = vim.api.nvim_create_augroup("NeovimLuaConfig", { clear = true })
  
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = augroup,
    pattern = "*.md",
    callback = function()
      vim.opt_local.spell = true
      vim.opt_local.linebreak = true
      vim.opt_local.number = false
    end,
    desc = "Set markdown file options"
  })
  
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = "Tiltfile",
    callback = function()
      vim.bo.filetype = "python"
    end,
    desc = "Set Tiltfile as Python filetype"
  })
  
  vim.g.markdown_fenced_languages = {
    "html",
    "json", 
    "css",
    "javascript",
    "java",
    "kotlin",
    "vim"
  }
  
  vim.api.nvim_create_autocmd("CursorHold", {
    group = augroup,
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
    desc = "Show diagnostic popup on cursor hold"
  })
end

M.setup()

return M