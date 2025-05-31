return {
  {
    "LintaoAmons/bookmarks.nvim",
    event = "VeryLazy",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    config = function()
      require("bookmarks").setup()
    end
  },
}

