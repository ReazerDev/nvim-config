require("flutter-tools").setup({
  flutter_path = "/opt/flutter/bin/flutter",
  ui = { border = "rounded" },

  decorations = {
    statusline = {
      device = true,
      app_version = true,
    }
  },

  debugger = {
    enabled = false,
    run_via_dap = false,
  },

  lsp = {
    on_attach = function(client, bufnr)
      local opts = { noremap=true, silent=true, buffer=bufnr }

      -- Basic LSP keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    end,

    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    settings = {
      showTodos = true,
      completeFunctionCalls = true,
    }
  }
})
