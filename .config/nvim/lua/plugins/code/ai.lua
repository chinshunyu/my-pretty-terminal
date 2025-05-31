return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    enabled = false,
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
    config = function()
      require("gen").setup({
        model = "gemini-pro", -- 使用 Gemini Pro 模型
        display_mode = "split", -- 在分屏中显示结果
        show_prompt = true, -- 显示提示信息
        command = "Gen",
        -- Gemini API key
        api_key = os.getenv("GEMINI_API_KEY"),
        -- 快捷键映射保持与之前类似
        keymaps = {
          ["<C-g>k"] = require("gen").select_model, -- 选择模型
          ["<M-k>i"] = require("gen").prompt, -- 发送提示
        }
      })
    end,
  },
}

