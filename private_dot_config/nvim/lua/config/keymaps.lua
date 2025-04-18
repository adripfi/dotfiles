-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- flash jump
-- vim.keymap.set({ "n", "v" }, "<leader>j", function()
--   require("flash").jump()
-- end)
-- vim.keymap.set({ "n", "v" }, "<leader>t", function()
--   require("flash").treesitter()
-- end)

-- leap
vim.keymap.set({ "n", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "o" }, "gs", "<Plug>(leap-from-window)")

--- yanky
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
-- vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
-- vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
-- vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
-- vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

-- Jump between Python methods using treesitter
vim.keymap.set("n", "{", function()
  require("nvim-treesitter.textobjects.move").goto_previous_start({
    query = "@function.outer",
    enable = true,
  })
end, { desc = "Jump to previous method" })

vim.keymap.set("n", "}", function()
  require("nvim-treesitter.textobjects.move").goto_next_start({
    query = "@function.outer",
    enable = true,
  })
end, { desc = "Jump to next method" })

--vscode specfig keymas
if vim.g.vscode then
  vim.g.mapleader = " "
  local vscode = require("vscode-neovim")

  -- undo/REDO via vscode
  vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
  vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")

  -- comment line using keymap g-c-c
  vim.keymap.set("n", "gcc", function()
    vscode.action("editor.action.commentLine")
  end)

  vim.keymap.set("v", "gc", function()
    vscode.action("editor.action.commentLine")
  end)

  -- jump between open files
  vim.keymap.set({ "n", "v" }, "H", function()
    vscode.action("workbench.action.previousEditor")
  end)
  vim.keymap.set({ "n", "v" }, "L", function()
    vscode.action("workbench.action.nextEditor")
  end)
  -- move open file tabs
  vim.keymap.set({ "n", "v" }, "<A-S-h>", function()
    vscode.action("workbench.action.moveEditorLeftInGroup")
  end)
  vim.keymap.set({ "n", "v" }, "<A-S-l>", function()
    vscode.action("workbench.action.moveEditorRightInGroup")
  end)

  -- focus on terminal and debug console
  vim.keymap.set({ "n", "v" }, "<leader>d", function()
    vscode.action("workbench.debug.action.focusRepl")
  end)
  vim.keymap.set({ "n", "v" }, "<leader>c", function()
    vscode.action("workbench.action.terminal.focus")
  end)

  -- open copilot inline chat
  -- vim.keymap.set({ "n", "v" }, "<leader>c", function()
  --   vscode.action("workbench.action.openQuickChat.copilot")
  -- end)

  -- open breadcrumbs/methods overview for navigating between functions or methods found in file
  vim.keymap.set({ "n", "v" }, "<leader>j", function()
    vscode.action("breadcrumbs.focusAndSelect")
  end)

  -- open/close sidebar
  vim.keymap.set({ "n", "v" }, "<leader>s", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end)
  -- open/close bottom bar
  vim.keymap.set({ "n", "v" }, "<leader>b", function()
    vscode.action("workbench.action.togglePanel")
  end)

  -- open/close sidebar
  vim.keymap.set({ "n", "v" }, "<leader>e", function()
    vscode.action("workbench.files.action.showActiveFileInExplorer")
  end)

  -- goto references or list references
  vim.keymap.set({ "n" }, "<leader>u", function()
    vscode.action("editor.action.goToReferences")
  end)

  --  split editor
  vim.keymap.set({ "n", "v" }, "<C-S-o>", function()
    vscode.action("workbench.action.splitEditorRight")
  end)
  vim.keymap.set({ "n", "v" }, "<C-S-e>", function()
    vscode.action("workbench.action.splitEditorDown")
  end)
  vim.keymap.set({ "n", "v" }, "go", function()
    vscode.action("workbench.action.showAllEditors")
  end)

  -- set flash highlight groups
  local hls = {
    FlashBackdrop = { fg = "#6c7086" },
    FlashCurrent = { bg = "#ff966c", fg = "#1b1d2b" },
    FlashLabel = { bg = "#ff007c", bold = true, fg = "#1b1d2b" },
    FlashMatch = { bg = "#3e68d7", fg = "#c8d3f5" },
    FlashCursor = { reverse = true },
  }
  for hl_group, hl in pairs(hls) do
    hl.default = true
    vim.api.nvim_set_hl(0, hl_group, hl)
  end
else
  --- kitty nav
  vim.keymap.set({ "n", "x" }, "<C-h>", ":KittyNavigateLeft<cr>", { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-l>", ":KittyNavigateRight<cr>", { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-j>", ":KittyNavigateDown<cr>", { silent = true })
  vim.keymap.set({ "n", "x" }, "<C-k>", ":KittyNavigateUp<cr>", { silent = true })
  vim.keymap.set({ "n", "x" }, "<leader>gp", ":Gitsigns preview_hunk<cr>", { silent = true })
end
