--@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd>DapToggleBreakpoint<CR>",
            "Add brakpoint at a line"
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Run or continue the debugger"
        }
    },
}

return M
