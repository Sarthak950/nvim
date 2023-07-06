local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "vtsls", "glint", "eslint"}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end




local cmp_nvim_lsp = require "cmp_nvim_lsp"

lspconfig.clangd.setup {
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp", "" },
    single_file_support = true,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}
lspconfig.cssls.setup{
    filetypes = {"css", "scss"},
    on_attach = on_attach,
    capabilities = capabilities,
}


lspconfig.eslint.setup {
    on_attach = on_attach,
    filetypes = {
        "js",
        "ts",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    cmd = { "vscode-eslint-language-server", "--stdio" },
    handlers = {
        ["eslint/confirmESLintExecution"] = function(_, result)
            if not result then
                return
            end
            return 4 -- approved
        end,

        ["eslint/noLibrary"] = function()
            vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
            return {}
        end,

        ["eslint/openDoc"] = function(_, result)
            if not result then
                return
            end
            local sysname = vim.loop.os_uname().sysname
            if sysname:match "Windows_NT" then
                os.execute(string.format("start %q", result.url))
            elseif sysname:match "Linux" then
                os.execute(string.format("xdg-open %q", result.url))
            else
                os.execute(string.format("open %q", result.url))
            end
            return {}
        end,

        ["eslint/probeFailed"] = function()
            vim.notify("[lspconfig] ESLint probe failed.", vim.log.levels.WARN)
            return {}
        end,
    },
    root_dir = require("lspconfig").util.root_pattern(
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        -- Disabled to prevent "No ESLint configuration found" exceptions
        "package.json"
    ),
    settings = {
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = "separateLine",
            },
            showDocumentation = {
                enable = true,
            },
        },
        codeActionOnSave = {
            enable = true,
            mode = "all",
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
            mode = "location",
        },
    },
    diagnostics = {
        enable = false,
    },
}

-- 
-- lspconfig.pyright.setup { blabla}
