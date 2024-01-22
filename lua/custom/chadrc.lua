-- @type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "oxocarbon",
  theme_toggle = { "oxocarbon", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    -- theme = "vscode_colored",
    theme = "vscode_colored", -- default, minimal, vscode, vscode_colored
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    -- overriden_modules = nil,
    override = require "custom.statusline"
  },

  nvdash = {
    load_on_startup = true,
  }

}
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- mine custom functions

-- M.ui.nvdash = {
--   load_on_startup = true,
--
--
--
--   header = {
--     "                             ",
--     "   NeoVim                    ",
--     "     ▄▄         ▄ ▄▄▄▄▄▄▄    ",
--     "   ▄▀███▄     ▄██ █████▀     ",
--     "   ██▄▀███▄   ███            ",
--     "   ███  ▀███▄ ███            ",
--     "   ███    ▀██ ███            ",
--     "   ███      ▀ ███            ",
--     "   ▀██ █████▄▀█▀▄██████▄     ",
--     "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀    ",
--     "        Povered By NvChad    ",
--   },
--
--
--   buttons = {
--     { "      Welcome Sarthak", "" },
--
--     { "  Find File", "Spc f f", "Telescope find_files" },
--     { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
--     { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
--     { "  Bookmarks", "Spc m a", "Telescope marks" },
--     { "  Themes", "Spc t h", "Telescope themes" },
--     { "  Mappings", "Spc c h", "NvCheatsheet" },
--   },
-- }



vim.opt.relativenumber = true

return M
