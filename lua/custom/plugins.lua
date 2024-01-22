local overrides = require("custom.configs.overrides")

--@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      -- {
      --     "jose-elias-alvarez/null-ls.nvim",
      --     config = function()
      --         require "custom.configs.null-ls"
      --     end,
      -- },
      {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
          return require "custom.configs.null-ls"
        end
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,     -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    -- opts = overrides.mason
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd"
      }
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = overrides.treesitter,

    opts = function()
      opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "toml",
        "bash",
        "python",
        "rust",
        "go",
        "java",
        "php",
        "vue",
        "c",
        "cpp",
      }
      return opts
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },


  {
    "mustache/vim-mustache-handlebars",
    lazy = false,
  },


  {
    "ThePrimeagen/vim-be-good",
  },

  {

    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot.suggestion").is_visible()
      require("copilot.suggestion").accept()
      require("copilot.suggestion").accept_word()
      require("copilot.suggestion").accept_line()
      require("copilot.suggestion").next()
      require("copilot.suggestion").prev()
      require("copilot.suggestion").dismiss()
      require("copilot.suggestion").toggle_auto_trigger()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            --accept = "<Tab>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom",             -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<S-Tab>",
            --accept_word = false,
            --accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          -- c = false,
          -- cpp = false,
          python = true,
          yaml = false,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node',         -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },


  {
    'RaafatTurki/hex.nvim',
    config = function()
      require('hex').setup()
      require 'hex'.dump()           -- switch to hex view
      require 'hex'.assemble()       -- go back to normal view
      require 'hex'.toggle()         -- switch back and forth
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    'mbbill/undotree',
    cmd = "UndotreeToggle",
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_SplitWidth = 35
      vim.g.undotree_SplitMinwidth = 15
      vim.g.undotree_SplitBelow = 0
      vim.g.undotree_SplitRight = 1
      vim.g.undotree_DiffpanelHeight = 10
      vim.g.undotree_DiffpanelWidth = 35
      vim.g.undotree_DiffpanelMinheight = 5
      vim.g.undotree_DiffpanelMinwidth = 20
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_HelpLine = 1
    end
  },
  {

    'JoosepAlviste/nvim-ts-context-commentstring',
    event = "BufRead",
    ft = {
      "javascript",
    },
    config = function()
      require('nvim-treesitter.configs').setup {}
      -- require('nvim-treesitter.configs').setup {
      --     context_commentstring = {
      --         enable = true,
      --         enable_autocmd = false,
      --     }
      -- }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

}


return plugins
