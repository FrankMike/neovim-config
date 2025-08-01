-- Main Neovim configuration entry point

local function safe_require(module)
    local ok, result = pcall(require, module)
    if not ok then
        vim.notify("Failed to load " .. module .. ": " .. result, vim.log.levels.ERROR)
        return nil
    end
    return result
end

-- Load core configuration modules
safe_require("config.options")
safe_require("config.keymaps")
safe_require("config.autocmds")

-- Initialize plugin manager and load plugins
safe_require("config.lazy")
