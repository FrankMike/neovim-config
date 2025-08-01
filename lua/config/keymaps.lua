-- Key mappings configuration
local M = {}

function M.setup()
  -- Set leader key
  vim.g.mapleader = " "
  
  vim.keymap.set("n", "<space>", "<leader>", { noremap = true })
  
  -- Clipboard operations
  vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, desc = "Copy to system clipboard" })
  vim.keymap.set("n", "<leader>Y", '"+yg_', { noremap = true, desc = "Copy line to system clipboard" })
  vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, desc = "Copy to system clipboard" })
  vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true, desc = "Copy entire line to system clipboard" })
  
  -- Paste from system clipboard
  vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard" })
  vim.keymap.set("n", "<leader>P", '"+P', { noremap = true, desc = "Paste before from system clipboard" })
  vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard" })
  vim.keymap.set("v", "<leader>P", '"+P', { noremap = true, desc = "Paste before from system clipboard" })
  
  -- Yank entire line with Y
  vim.keymap.set("n", "Y", "yy", { noremap = true, desc = "Yank entire line" })
  
  -- File search with fzf (will be configured when fzf plugin is loaded)
  vim.keymap.set("n", "<C-p>", "<cmd>Files<cr>", { noremap = true, desc = "Find files" })
  
  -- File explorer toggle (will be configured when tree plugin is loaded)
  vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeToggle<cr>", { noremap = true, desc = "Toggle file explorer" })
  
  -- Custom key bindings from keys.vimrc
  vim.keymap.set("i", "jk", "<ESC>", { noremap = true, desc = "Exit insert mode" })
  
  -- Rust development shortcuts
  vim.keymap.set("i", "DD", 'println!("', { noremap = true, desc = "Rust println macro" })
  vim.keymap.set("i", "DDD", 'println!("{:#?}", ', { noremap = true, desc = "Rust debug println macro" })
  vim.keymap.set("i", "DDDD", "#[derive(Debug,Clone)]", { noremap = true, desc = "Rust derive macro" })
  vim.keymap.set("i", "WW", ".map_err(|_| ())?;", { noremap = true, desc = "Rust error mapping" })
  
  -- Clean screen with semicolon (instead of Ctrl-L)
  vim.keymap.set("n", ";", "<C-l>", { noremap = true, desc = "Clear screen" })
  
  -- Find current file in tree
  vim.keymap.set("n", ",", "<cmd>NvimTreeFindFile<cr>", { noremap = true, desc = "Find current file in tree" })
  
  -- LSP key mappings
  vim.keymap.set("n", "<g2>", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show hover information" })
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Go to implementation" })
  vim.keymap.set("n", "<g3>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Show signature help" })
  vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, { noremap = true, silent = true, desc = "Go to type definition" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Show references" })
  vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, { noremap = true, silent = true, desc = "Show document symbols" })
  vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, { noremap = true, silent = true, desc = "Show workspace symbols" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
  
  -- Code actions
  vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Show code actions" })
  
  -- Diagnostic navigation
  vim.keymap.set("n", "g[", function() vim.diagnostic.goto_prev({ wrap = false }) end, { noremap = true, silent = true, desc = "Go to previous diagnostic" })
  vim.keymap.set("n", "g]", function() vim.diagnostic.goto_next({ wrap = false }) end, { noremap = true, silent = true, desc = "Go to next diagnostic" })
  

end

-- Auto-setup when module is loaded
M.setup()

return M