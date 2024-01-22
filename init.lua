require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

-- i did this for some reason i dont know maybe neovide or it might be neovide idk idc fuck of
if vim.g.neovide then
    vim.opt.guifont = "JetBrainsMono Nerd Font:h11:b:#e-subpixelantialias"
    vim.opt.linespace = 1

    vim.g.neovide_padding_top = 10
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.g.neovide_scale_factor = 1.0

    -- helper function for transparency formatting
    local alpha = function()
        return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.transparency = 1
    vim.g.neovide_transparency = 0.8
    vim.g.neovide_background_color = "#0f1117" .. alpha()

    vim.g.neovide_floating_blur_amount_x = 8.0
    vim.g.neovide_floating_blur_amount_y = 8.0

    vim.g.neovide_hide_mouse_when_typing = true

    vim.g.neovide_scroll_animation_length = 0.2

    vim.g.neovide_theme = 'auto'
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_cursor_animation_length = 0.1
    vim.g.neovide_cursor_trail_length = 10
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 10.0


    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_in_normal_mode = true
    vim.g.neovide_cursor_animate_in_visual_mode = true
    vim.g.neovide_cursor_animate_in_replace_mode = true
    vim.g.neovide_cursor_animate_in_command_mode = true
    vim.g.neovide_cursor_animate_in_term_mode = true
    vim.g.neovide_cursor_vfx_mode = "sonicboom"

end




dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
