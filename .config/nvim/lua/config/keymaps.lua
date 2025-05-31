-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>l", {})
vim.keymap.del({ "n", "i", "v" }, "<A-j>", {})
vim.keymap.del({ "n", "i", "v" }, "<A-k>", {})

-- Function to run current file based on filetype
local function run_current_file()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%:p")
  
  local runners = {
    python = "python3 " .. filename,
    lua = "lua " .. filename,
    javascript = "node " .. filename,
    typescript = "ts-node " .. filename,
    go = "go run " .. filename,
    rust = "cargo run",
    cpp = "g++ -o " .. vim.fn.expand("%:r") .. " " .. filename .. " && " .. vim.fn.expand("%:r"),
    c = "gcc -o " .. vim.fn.expand("%:r") .. " " .. filename .. " && " .. vim.fn.expand("%:r"),
  }

  local runner = runners[filetype]
  if runner then
    -- 创建或切换到输出窗口
    local buf = vim.api.nvim_create_buf(false, true)
    local current_win = vim.api.nvim_get_current_win()
    
    -- 检查是否已经存在输出窗口
    local output_win = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local win_buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_option(win_buf, 'buftype') == 'terminal' then
        output_win = win
        break
      end
    end

    -- 如果没有输出窗口，创建一个新的
    if not output_win then
      -- 分割窗口，在底部创建终端
      vim.cmd('botright 15split')
      output_win = vim.api.nvim_get_current_win()
    end

    -- 切换到输出窗口
    vim.api.nvim_set_current_win(output_win)
    
    -- 创建终端并运行命令
    vim.cmd('terminal ' .. runner)
    
    -- 自动滚动到底部
    vim.cmd('normal! G')
    
    -- 切回原来的窗口
    vim.api.nvim_set_current_win(current_win)
    
    -- 设置终端缓冲区的一些选项
    vim.cmd([[
      setlocal nonumber
      setlocal norelativenumber
      setlocal signcolumn=no
      setlocal winfixheight
    ]])
  else
    vim.notify("No runner configured for filetype: " .. filetype, vim.log.levels.WARN)
  end
end

-- Function to close the output window
local function close_output_window()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  vim.notify("No output window found", vim.log.levels.INFO)
end

local command_keymappings = {
	["BookmarksGotoRecent"] = { modes = "n,v", keys = "mg" },
	["BookmarksMark"] = "mm",
	["BookmarksCommands"] = "ma",
	["BookmarksGoto"] = "mo",
	["ObsidianQuickSwitch"] = "<leader>nf", -- note finder

	-- HACK: Debug
	["ToggleDebugUI"] = "<M-5>",
	["DebugStartOrContinue"] = "<F5>",
	["DebugToggleBreakpoint"] = "<F9>",
	["DebugStepOver"] = "<F8>",
	["DebugStepInto"] = "<F7>",
	["DebugStop"] = "<M-F2>",
	["TriggerLastRun"] = "<leader>rr",

	-- HACK: DB
	["DBUIToggle"] = "<M-C-9>",

	["AskGpt4"] = "<C-g>k",
	["GpAppend"] = { keys = "<M-k>i", modes = "v" },
	["TmuxNavigateLeft"] = "<C-h>",
	["TmuxNavigateRight"] = "<C-l>",
	["TmuxNavigateUp"] = "<M-k>",
	["TmuxNavigateDown"] = "<C-j>",
	["FoldAll"] = "<leader>zc",
	["UnFoldAll"] = "<leader>zo",
	["FindCommands"] = { modes = "n,i,v", keys = "<C-M-p>" },
	["FindFiles"] = "<C-p>",
	["NoHighlight"] = "<leader>nl",
	["Format"] = "<leader>fm",
	["QuitNvim"] = "<M-q>",

	["CloseWindowOrBuffer"] = "<M-w>",
	["MaximiseWindow"] = "<Leader>wo",
	["SplitVertically"] = "<leader>wl",

	["Scratch"] = "<M-C-n>",
	["ScratchOpen"] = "<M-C-o>",
	["FindInProject"] = { modes = "n,v", keys = "<C-f>f" },
	["FindFileInDir"] = { modes = "n,v", keys = "<C-f>d" },
	["GrepInDir"] = { modes = "n,v", keys = "<C-f>g" },
	["SearchOrReplace"] = { modes = "n,v", keys = "<C-M-f>" },
	["Rename"] = "<leader>rn",
	["CdProject"] = "<C-q>",

	-- HACK: GIT
	["PeekGitChange"] = "<M-k>j",
	["GitCommit"] = "<M-k>c",
	["GitNextHunk"] = "gj",
	["GitPrevHunk"] = "gk",
	["GitDiff"] = "<M-0>",
	["GitStatus"] = "<leader>gs",
	["Git"] = "<leader>gg",
	["BlameLine"] = "<leader>gl",
	["BufferPrev"] = "<S-h>",
	["BufferNext"] = "<S-l>",
	["TabClose"] = "tt",
	["TabPrev"] = "th",
	["TabNext"] = "tl",

	["GoToTestFile"] = "gt",
	["TestRunNearest"] = "<leader>rt",
	["GoToDefinition"] = "gd",
	["GoToDefinitionInSplit"] = "gl",
	["PeekDefinition"] = "<M-k>k",
	["PeekTypeDefinition"] = "<M-k>l",
	["GoToFunctionName"] = "gm",

	["LspFinder"] = "<M-k>f",

	["SentToTerminalAndRun"] = { modes = "n,v", keys = "<leader>sj" },
	["SendSelectedToTerminalAndRun"] = { modes = "n,v", keys = "<leader>sk" },
	["SendLineToTerminalAndRun"] = { modes = "n,v", keys = "<leader>sl" },
	["RunCurrentBuffer"] = "<M-r>",
	["RunShellAtBufDir"] = { modes = "n,v", keys = "<leader>rk" },
	["RunShellCurrentLine"] = { modes = "n,v", keys = "<leader>rl" },
	["MaximiseWindowAsPopup"] = { modes = "n,v,t", keys = "<leader>wp" },
	["RunCurrentFile"] = "<leader>rf",
}

-- neovide use <D-key> represents the cmd key in mac
local function convertNeovideCMDKey(key)
	if vim.g.neovide then
		return string.gsub(key, "M%-", "D-")
	else
		return key
	end
end

local function getKey(keybinding)
	if type(keybinding) == "string" then
		return keybinding
	else
		return keybinding.keys
	end
end

local function registerKeys()
	for command, keybinding in pairs(command_keymappings) do
		local key = convertNeovideCMDKey(getKey(keybinding))

		local modes = keybinding.modes and vim.split(keybinding.modes, ",") or { "n" }
		vim.keymap.set(modes, key, "<CMD>" .. command .. "<CR>", {})
	end
end

registerKeys()

-- don't overwrite the clipboard
vim.keymap.set("v", "p", "P")

-- explorer
vim.keymap.set("n", "<leader>fl", "<cmd>Neotree reveal reveal_force_cwd<cr>", { desc = "ExplorerFindFileLocation" })
vim.keymap.set("n", "<M-1>", "<cmd>Neotree toggle<cr>", { desc = "ExplorerToggle" })

vim.keymap.set("n", "<M-e>", "<cmd>Telescope frecency<cr>", { desc = "FindRecentFiles" })
vim.keymap.set({ "n", "v" }, "<M-k><M-k>", "<cmd>Lspsaga code_action<cr>", { desc = "CodeActions" })
vim.keymap.set({ "i", "v", "t" }, "jk", [[<C-\><C-n>]], { buffer = 0 })

vim.keymap.set("n", "<leader>ss", "<cmd>Lspsaga outline<cr>", { desc = "ToggleOutline" })
vim.keymap.set("v", "<C-M-j>", "<CMD>VisualDuplicate +1<CR>", { desc = "Duplication" })

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
map("n", "<C-M-l>", "<cmd>vertical resize +5<cr>", { desc = "Increase window width" })
map("n", "<C-M-h>", "<cmd>vertical resize -5<cr>", { desc = "Decrease window width" })

-- TODO: Move to easy-commands
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
end

local lazyterm = function()
	require("lazyvim.util").terminal.open(nil, { cwd = require("lazyvim.util").root.get() })
end
map("n", "<c-\\>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

vim.keymap.set("n", "<leader>e", ":Triptych<CR>", { silent = true })

-- 注册运行当前文件的命令
vim.api.nvim_create_user_command("RunCurrentFile", run_current_file, {})
vim.api.nvim_create_user_command("CloseOutputWindow", close_output_window, {})

-- 设置快捷键映射
vim.keymap.set("n", "<leader>rf", run_current_file, { desc = "Run current file" })
vim.keymap.set("n", "<leader>rx", close_output_window, { desc = "Close output window" })

