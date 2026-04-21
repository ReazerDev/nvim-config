require("telescope").load_extension("csharpls_definition")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config["csharp_ls"] = {
  cmd = { "csharp-ls", "-f", "razor-support,metadata-uris" },
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = require('csharpls_extended').handler,
    ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
  },
  filetypes = { "cs", "razor" },
  root_dir = vim.fs.root(0, { "*.sln", "*.csproj", ".git" }),
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    
    vim.keymap.set('n', 'gd', require("telescope").extensions.csharpls_definition.csharpls_definition, opts)
    vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
  end
}
require("csharpls_extended").buf_read_cmd_bind()