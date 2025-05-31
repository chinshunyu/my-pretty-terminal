return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    window = {
      border = "single",
      margin = { 1, 0, 1, 0 }, -- 上右下左边距
      padding = { 1, 2, 1, 2 }, -- 上右下左内边距
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "center",
    },
    show_help = true,
    show_keys = true,
    disable = {
      filetypes = { "TelescopePrompt", "spectre_panel" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    
    -- 注册所有映射
    wk.register({
      -- 组
      ["<leader>b"] = { name = "Buffers" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>d"] = { name = "Debug" },
      ["<leader>f"] = { name = "Files" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>gh"] = { name = "Hunks" },
      ["<leader>h"] = { name = "Help" },
      ["<leader>l"] = { name = "LSP" },
      ["<leader>n"] = { name = "Notes" },
      ["<leader>r"] = { name = "Run/Rename" },
      ["<leader>s"] = { name = "Search/Send" },
      ["<leader>t"] = { name = "Terminal/Tests" },
      ["<leader>w"] = { name = "Windows" },
      ["<leader>z"] = { name = "Fold" },
      ["g"] = { name = "Goto" },
      ["m"] = { name = "Bookmarks" },
      ["t"] = { name = "Tabs" },

      -- 具体映射
      ["<leader>fm"] = { vim.lsp.buf.format, "Format" },
      ["<leader>nl"] = { "<cmd>nohl<CR>", "No Highlight" },
      ["<leader>gs"] = { "<cmd>Git<CR>", "Git Status" },
      ["<leader>gg"] = { "<cmd>LazyGit<CR>", "LazyGit" },
      ["<leader>gl"] = { "<cmd>Git blame<CR>", "Git Blame" },
      ["<leader>wo"] = { "<cmd>only<CR>", "Maximize Window" },
      ["<leader>wl"] = { "<cmd>vsplit<CR>", "Split Vertically" },
      ["<leader>wp"] = { "<cmd>WindowsMaximize<CR>", "Maximize as Popup" },
    })
  end,
}

