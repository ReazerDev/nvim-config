local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config["ts_ls"] = {
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "razor" },
  root_dir = vim.fs.root(0, { ".git", "bin", "obj" }),
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
  
    vim.keymap.set('n', 'gd', require("telescope.builtin").lsp_definitions, opts)
    vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
  end
}
