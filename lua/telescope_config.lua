local telescope = require('telescope.builtin')
local telescope_last = 0
function telescope_resume()
  if telescope_last == 0 then
    telescope_last = 1
    telescope.live_grep()
  else
    telescope.resume()
  end
end
vim.keymap.set("n", ".f", telescope_resume)
require('telescope').setup({
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown{} }
  }
})
require('telescope').load_extension('ui-select')
require("telescope").load_extension("csharpls_definition")
