-- Utility functions and helpers
-- This module contains common utility functions used throughout the configuration

local M = {}

-- Safe require function with error handling
function M.safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("Failed to load " .. module .. ": " .. result, vim.log.levels.ERROR)
    return nil
  end
  return result
end

-- Check if a plugin is available
function M.has_plugin(plugin_name)
  local ok, _ = pcall(require, plugin_name)
  return ok
end

-- Configuration validation function
function M.validate_config()
  local required_plugins = { "lazy" }
  local missing_plugins = {}
  
  for _, plugin in ipairs(required_plugins) do
    if not pcall(require, plugin) then
      table.insert(missing_plugins, plugin)
    end
  end
  
  if #missing_plugins > 0 then
    vim.notify("Missing required plugins: " .. table.concat(missing_plugins, ", "), vim.log.levels.ERROR)
    return false
  end
  
  return true
end

-- Helper function for LSP server setup with error handling
function M.setup_lsp_server(server_name, config)
  local ok, lspconfig = pcall(require, "lspconfig")
  if not ok then
    vim.notify("LSP config not available", vim.log.levels.WARN)
    return false
  end
  
  if lspconfig[server_name] then
    lspconfig[server_name].setup(config)
    return true
  else
    vim.notify("LSP server " .. server_name .. " not found", vim.log.levels.WARN)
    return false
  end
end

-- Helper function to check if words are before cursor (for completion)
function M.has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Helper function for feeding keys (used in completion mappings)
function M.feedkey(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return M