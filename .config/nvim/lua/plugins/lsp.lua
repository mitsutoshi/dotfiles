return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()

      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")
      local servers = { "gopls", "pyright", "rust_analyzer" }
      --mason_lspconfig.setup({
      --  ensure_installed = servers,
      --  handlers = {},
      --})

      local lspconfig = require("lspconfig")

      local function on_attach(client, bufnr)
        if client.name == "rust_analyzer" then
          client.server_capabilities.documentFormattingProvider = false
        end

        local map = vim.keymap.set
        local opts = { buffer = bufnr, noremap = true, silent = true }

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "<leader>h", vim.lsp.buf.hover, opts)
        map("n", "<leader>i", vim.lsp.buf.implementation, opts)
        map("n", "<leader>r", vim.lsp.buf.references, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
        map("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true })
      end


      lspconfig.gopls.setup {
          on_attach = on_attach,
          settings = {
            gopls = {
              staticcheck = true,
              usePlaceholders = true,
              completeUnimported = true,
            },
          },
      }

      lspconfig.rust_analyzer.setup {
          on_attach = on_attach,
          settings = {
              ["rust-analyzer"] = {
                  cargo = { allFeatures = true },
                  check = { command = "clippy" },
                  formatting = { enable = true },
              },
          },
      }

      lspconfig.pyright.setup {
          on_attach = on_attach,
      }

    end,
  }
}
