return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()

      require("mason").setup()

      -- Set up keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          if client and client.name == "rust_analyzer" then
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
        end,
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            staticcheck = true,
            usePlaceholders = true,
            completeUnimported = true,
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            check = { command = "clippy" },
            formatting = { enable = true },
          },
        },
      })

      vim.lsp.enable({ "gopls", "rust_analyzer", "pyright" })

    end,
  }
}
