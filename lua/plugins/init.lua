return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    keys = {
        { "<leader>fu", "<cmd>lua require(\"telescope.builtin\").lsp_references()<cr>", desc = "LazyGit" }
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    -- you can just use the latest version:
    branch = "latest",
    -- or the most up-to-date updates:
    -- branch = "nightly",
    lazy = true,
    cmd = {
        "Compile",
        "NextError",
        "PrevError",
        "CurrentError",
        "FirstError",
        "QuickfixErrors" ,
     },
    keys = {
        { "<leader>cm", "<cmd>Compile<cr>", desc = "Compile" }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- if you want to enable coloring of ANSI escape codes in
      -- compilation output, add:
      { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
          -- to add ANSI escape code support, add:
          baleia_setup = true,

          -- to make `:Compile` replace special characters (e.g. `%`) in
          -- the command (and behave more like `:!`), add:
          -- bang_expansion = true,
      }
    end
  },
  {
    'isakbm/gitgraph.nvim',
    dependencies = { 'sindrets/diffview.nvim' },
    ---@type I.GGConfig
    opts = {
      hooks = {
        -- Check diff of a commit
        on_select_commit = function(commit)
          vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
          vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
          vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
        end,
      },
    },
    git_cmd = "git",
    symbols = {
      merge_commit = 'M',
      commit = '*',
    },
    format = {
      timestamp = '%H:%M:%S %d-%m-%Y',
      fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
