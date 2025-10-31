return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()

      require("mason").setup()

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

      -- Go
      vim.lsp.config('gopls', {
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
      vim.lsp.config('pyright', {
          on_attach = on_attach,
      })

      -- Rust
      vim.lsp.config('rust_analyzer', {
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

