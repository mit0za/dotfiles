local plugins = {
    {
      "mfussenegger/nvim-jdtls",
    },
    {
      "CRAG666/code_runner.nvim",
      config = function ()
        require('code_runner').setup({
          filetype = {
            java = {"cd '$dir' && javac $fileName && java $fileNameWithoutExt"},
            python = "python3 -u",
            typescript = "deno run",
            rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt"
       },
      },
    })
      end,
      lazy = false,
    },
    {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    },
    {
      "christoomey/vim-tmux-navigator",
      lazy = false,
    },
    {
      "tpope/vim-fugitive",
      lazy = false,
    },
    {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
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
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright", -- a full-featured, standards-based static type checker for Python
        "mypy",
        "ruff",
        "black", -- an auto formatter
        "debugpy",
        "jdtls",
        "stylua",
        "java-language-server",
        "lua-language-server",
        "djlint"
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
}
return plugins
