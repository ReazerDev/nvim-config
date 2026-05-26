require('lsp/flutter')
require('cmp_setup')

local diag_group = vim.api.nvim_create_augroup("LspDiagnosticsOnHover", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = diag_group,
  callback = function(args)
    vim.api.nvim_create_autocmd("CursorHold", {
      group = diag_group,
      buffer = args.buf,
      callback = function()
        vim.diagnostic.open_float(nil, {
          focus = false,
          border = "rounded",
          severity_sort = true,
          scope = "c"
        })
      end,
    })
  end,
})
