-- Configuration validation utilities
-- This module provides functions to validate the migrated configuration

local M = {}

-- Validate that all required modules can be loaded
function M.validate_modules()
  local required_modules = {
    "config.options",
    "config.keymaps", 
    "config.autocmds",
    "config.lazy",
    "utils.helpers"
  }
  
  local failed_modules = {}
  
  for _, module in ipairs(required_modules) do
    local ok, _ = pcall(require, module)
    if not ok then
      table.insert(failed_modules, module)
    end
  end
  
  if #failed_modules > 0 then
    vim.notify("Failed to load modules: " .. table.concat(failed_modules, ", "), vim.log.levels.ERROR)
    return false
  end
  
  vim.notify("All core modules loaded successfully", vim.log.levels.INFO)
  return true
end

-- Validate that key mappings are set correctly
function M.validate_keymaps()
  local test_keys = {
    { mode = "n", key = "<leader>f", desc = "file explorer" },
    { mode = "n", key = "<C-p>", desc = "file search" },
    { mode = "i", key = "jk", desc = "escape" },
    { mode = "n", key = "gd", desc = "go to definition" },
  }
  
  local failed_keys = {}
  
  for _, keymap in ipairs(test_keys) do
    local maps = vim.api.nvim_get_keymap(keymap.mode)
    local found = false
    
    for _, map in ipairs(maps) do
      if map.lhs == keymap.key then
        found = true
        break
      end
    end
    
    if not found then
      table.insert(failed_keys, keymap.key .. " (" .. keymap.desc .. ")")
    end
  end
  
  if #failed_keys > 0 then
    vim.notify("Missing key mappings: " .. table.concat(failed_keys, ", "), vim.log.levels.WARN)
    return false
  end
  
  vim.notify("Key mappings validated successfully", vim.log.levels.INFO)
  return true
end

-- Validate that no Haskell functionality remains
function M.validate_no_haskell()
  -- Check for Haskell-related files
  local haskell_files = {
    "haskell.vim",
    "cabal.vim", 
    "syntax/haskell.vim",
    "syntax/cabal.vim"
  }
  
  local found_files = {}
  
  for _, file in ipairs(haskell_files) do
    if vim.fn.filereadable(file) == 1 then
      table.insert(found_files, file)
    end
  end
  
  if #found_files > 0 then
    vim.notify("Found Haskell files that should be removed: " .. table.concat(found_files, ", "), vim.log.levels.ERROR)
    return false
  end
  
  vim.notify("No Haskell files found - cleanup successful", vim.log.levels.INFO)
  return true
end

-- Validate that essential options are set
function M.validate_options()
  local essential_options = {
    { option = "number", expected = true },
    { option = "expandtab", expected = true },
    { option = "tabstop", expected = 2 },
    { option = "shiftwidth", expected = 4 },
    { option = "undofile", expected = true },
    { option = "signcolumn", expected = "yes" },
  }
  
  local failed_options = {}
  
  for _, opt in ipairs(essential_options) do
    local actual = vim.opt[opt.option]:get()
    if actual ~= opt.expected then
      table.insert(failed_options, opt.option .. " (expected: " .. tostring(opt.expected) .. ", got: " .. tostring(actual) .. ")")
    end
  end
  
  if #failed_options > 0 then
    vim.notify("Option validation failed: " .. table.concat(failed_options, ", "), vim.log.levels.ERROR)
    return false
  end
  
  vim.notify("Essential options validated successfully", vim.log.levels.INFO)
  return true
end

-- Run all validation checks
function M.validate_all()
  vim.notify("Starting configuration validation...", vim.log.levels.INFO)
  
  local results = {
    modules = M.validate_modules(),
    options = M.validate_options(),
    keymaps = M.validate_keymaps(),
    no_haskell = M.validate_no_haskell(),
  }
  
  local all_passed = true
  for _, result in pairs(results) do
    if not result then
      all_passed = false
      break
    end
  end
  
  if all_passed then
    vim.notify("✅ All validation checks passed! Migration completed successfully.", vim.log.levels.INFO)
  else
    vim.notify("❌ Some validation checks failed. Please review the issues above.", vim.log.levels.ERROR)
  end
  
  return all_passed
end

-- Create user command for validation
vim.api.nvim_create_user_command("ValidateConfig", function()
  M.validate_all()
end, { desc = "Validate the migrated configuration" })

return M