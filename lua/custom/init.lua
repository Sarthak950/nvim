-- local autocmd = vim.api.nvim_create_autocmd


-- i did this
-- to open nvim-tree on startup
local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
  -- pattern = "*",
  -- command = "tabdo wincmd =",
-- })
