require('./lsp/csharp-ls')
require('./lsp/html-ls')
require('./lsp/js-ls')
require('./lsp/css-ls')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local navic = require("nvim-navic")

        if client and client.server_capabilities.documentSymbolProvider then
            local is_razor = (vim.bo[args.buf].filetype == "razor")
            local already_attached = (navic.get_data(args.buf) ~= nil)

            if is_razor then
                if client.name == "csharp_ls" and not already_attached then
                    navic.attach(client, args.buf)
                end
            else
                if not already_attached then
                    navic.attach(client, args.buf)
                end
            end
        end
    end
})

vim.lsp.enable("csharp_ls")
vim.lsp.enable("html")
vim.lsp.enable("ts_ls")
vim.lsp.enable("cssls")

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = { "*" },
  callback = function()
    vim.diagnostic.open_float({ 
      scope = 'c', 
      focus = false,
      border = "rounded",
      source = "always",
      header = "",
    })
  end,
})
