return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()

      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "pyright", "rust_analyzer" },
        automatic_installation = true,
      })

      local function on_attach(_, bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr, noremap = true, silent = true }
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "K",  vim.lsp.buf.hover, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
        map("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true })
      end

      local lspconfig = require("lspconfig")

      -- Go
      lspconfig.gopls.setup({
          on_attach = on_attach,
          settings = {
            gopls = {
              staticcheck = true,
              usePlaceholders = true,
              completeUnimported = true,
            },
          },
      })

      -- Python
      lspconfig.pyright.setup({
          on_attach = on_attach,
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
          on_attach = on_attach,
          settings = {
              ["rust-analyzer"] = {
                  cargo = { allFeatures = true },
                  check = { command = "clippy" },
              },
          },
      })
    end,
  }
}

