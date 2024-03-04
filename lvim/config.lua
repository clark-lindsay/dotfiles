--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "sonokai"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "elixir",
  "heex",
  "java",
  "javascript",
  "markdown",
  "json",
  "lua",
  "python",
  "rust",
  "svelte",
  "tsx",
  "typescript",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.hoverProvider then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    end

    if client.server_capabilities.definitionProvider then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
    end
  end,
})

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "epwalsh/obsidian.nvim" },
  { "ggandor/leap.nvim" },
  { "sainnhe/sonokai" },
  { "rebelot/kanagawa.nvim" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "vim-test/vim-test" },
  {
    "mhanberg/output-panel.nvim",
    config = function()
      require("output_panel").setup()
    end
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")

      elixir.setup {
        nextls = {
          enable = true,
          init_options = {
            mix_env = "dev",
            mix_target = "host",
            -- experimental = {
            --   completions = {
            --     enable = true
            --   }
            -- }
          },
        },
        credo = {},
        elixirls = {
          enable = true,
          settings = elixir.elixirls.settings {
            dialyzerEnabled = true,
            enableTestLenses = false,
          },
          -- on_attach = function(client, bufnr)
          --   vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          --   vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          --   vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          -- end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

require('leap').add_default_mappings()

require("obsidian").setup({
  dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/amber",
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  }
})
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["T"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["g"] = {
  name = "Go To...",
  d = { "<cmd>vim.lsp.buf.definition()<cr>", "Definition" },
}

vim.g["test#neovim#start_normal"] = 1 -- start test buffer in Normal mode
lvim.builtin.which_key.mappings["t"] = {
  name = "VimTest",
  n = { "<cmd>TestNearest<cr>", "Test Nearest" },
  f = { "<cmd>TestFile<cr>", "Test File" },
  l = { "<cmd>TestLast<cr>", "Test Last" },
  s = { "<cmd>TestSuite<cr>", "Test Suite" },
  v = { "<cmd>TestVisit<cr>", "Test Visit" },
}


-- normal mode window navigation mappings for colemak keyboard layout
vim.keymap.set('n', '<C-n>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-e>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-i>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-o>', '<C-w>l', { noremap = true })

-- terminal mode window navigation mappings for colemak keyboard layout
vim.keymap.set('t', '<C-n>', '<C-\\><C-n><C-w>h', { noremap = true })
vim.keymap.set('t', '<C-n>', '<C-\\><C-n><C-w>j', { noremap = true })
vim.keymap.set('t', '<C-n>', '<C-\\><C-n><C-w>k', { noremap = true })
vim.keymap.set('t', '<C-n>', '<C-\\><C-n><C-w>l', { noremap = true })

-- Line up 'Y' with the other linewise commands
vim.keymap.set('n', 'Y', 'y$', { noremap = true })

-- Make a newline above and below the cursor
vim.keymap.set('n', '<Leader><CR>', 'O<esc><Down>o<esc><Up>', { noremap = true })

-- use qq to record into register 'q', and Q to replay it
vim.keymap.set('n', 'Q', '@q', { noremap = true })

-- Create splits, using symbols that look like the division that i want to create
vim.keymap.set("n", "<Leader>|", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>-', ':split<CR>', { noremap = true, silent = true })

-- `which_key` menu for highlight options
lvim.builtin.which_key.mappings["h"] = {
  name = "Highlighting",
  t = { ":set hlsearch!<CR>", "Toggle On/Off" },
  r = { ":noh<CR>", "Remove active highlights" },
}
