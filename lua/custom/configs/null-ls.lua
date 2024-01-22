local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
    return
end

local b = null_ls.builtins

local sources = {

    -- webdev stuff
    b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    b.formatting.prettierd.with {
        filetypes = { "html", "markdown", "css", "c", "cpp", "js", "python" },
        cli_options = {
            tab_width = 4,
            use_tabs = true,
        }
    }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua,
    -- cpp
    b.formatting.clang_format,
}

local opts = {
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettierd,
    },
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds {
                group = augroup,
                buffer = bufnr,
            }
            vim.api.nvim_create_augroup("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
}

null_ls.setup {
    debug = true,
    sources = sources,
    opts = opts,
}
