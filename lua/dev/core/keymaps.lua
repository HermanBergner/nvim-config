local keymap = vim.keymap

-- Telescope
local telescope = require("telescope.builtin")

keymap.set("n", "<leader>ff", function()
  telescope.find_files({ hidden = true })
end,{ desc = "Fuzzy find files in cwd" })

keymap.set("n", "<leader>fr", function()
  telescope.oldfiles()
end,{ desc = "Fuzzy find files in recent files" })

keymap.set("n", "<leader>fg", function()
  telescope.live_grep()
end,{ desc = "Find string in cwd" })

keymap.set("n", "<leader>fc", function()
  telescope.grep_string()
end,{ desc = "Find string under cursor in cwd" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
