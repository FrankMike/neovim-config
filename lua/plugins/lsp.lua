-- LSP and language server plugins

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua LSP (replacing sumneko_lua)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Python LSP (replacing pyls with pylsp)
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      -- HTML LSP
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- SQL LSP
      lspconfig.sqlls.setup({
        capabilities = capabilities,
      })

      -- CSS LSP
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      -- C++ LSP
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- Java LSP
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })

      -- Kotlin LSP
      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities,
      })

      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },

  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "rust",
    config = function()
      local rust_tools = require("rust-tools")
      rust_tools.setup({
        tools = {
          autoSetHints = true,
          hover_with_actions = true,
          inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
          },
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      })
    end,
  },

  -- LSP Extensions (for inlay hints)
  {
    "nvim-lua/lsp_extensions.nvim",
    config = function()
      -- Enable type inlay hints
      vim.api.nvim_create_autocmd({ "CursorMoved", "InsertLeave", "BufEnter", "BufWinEnter", "TabEnter", "BufWritePost" }, {
        callback = function()
          require("lsp_extensions").inlay_hints({
            prefix = "",
            highlight = "Comment",
          })
        end,
      })
    end,
  },
}