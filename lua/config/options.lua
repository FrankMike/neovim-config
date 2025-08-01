-- General Neovim options configuration

local M = {}

function M.setup()
  -- Line numbers
  vim.opt.number = true
  
  -- Tab settings
  vim.opt.tabstop = 2
  vim.opt.expandtab = true
  vim.opt.shiftwidth = 4
  
  -- Split window settings
  vim.opt.fillchars:append("vert:*")
  
  -- Disable swap files
  vim.opt.swapfile = false
  
  -- Mouse settings
  vim.opt.mouse = "a"
  
  -- Show matching brackets
  vim.opt.showmatch = true
  
  -- Folding
  vim.opt.foldmethod = "indent"
  
  -- Visual line at 100 characters
  vim.opt.colorcolumn = "100"
  vim.opt.textwidth = 100
  
  -- Persistent undo
  vim.opt.undofile = true
  
  -- Enable syntax highlighting and file type detection
  vim.cmd("syntax enable")
  vim.cmd("filetype plugin indent on")
  
  -- Completion settings
  vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
  vim.opt.shortmess:append("c")
  
  -- Terminal colors
  if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
  end
  
  -- LSP-related options
  vim.opt.updatetime = 300  -- CursorHold trigger time
  vim.opt.signcolumn = "yes"  -- Fixed column for diagnostics
  
  -- Create user commands
  vim.api.nvim_create_user_command("Wsudo", function()
    vim.cmd("execute ':silent w !sudo tee % > /dev/null' | :edit!")
  end, { desc = "Save file with sudo" })
  
  vim.api.nvim_create_user_command("W", function(opts)
    vim.cmd("write" .. (opts.bang and "!" or "") .. " " .. (opts.args or ""))
  end, { bang = true, nargs = "*", complete = "file", desc = "Save file (alias for :w)" })
  
  -- Set up macros (from macros.vimrc)
  vim.fn.setreg("t", [[Gotest(`,testedFucntion whatIsTested`, assert => {
const actual = 1;
const expected = 1;

assert.deepE(actual, expected,
`expected bheaviour`);
assert.end();
});]])
end

-- Auto-setup when module is loaded
M.setup()

return M