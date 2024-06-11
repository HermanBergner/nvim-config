return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- function to handle split actions
    local function open_nvim_tree_split(split_type)
      return function()
        local lib = require("nvim-tree.lib")
        local node = lib.get_node_at_cursor()
        if node then
          if split_type == "vsplit" then
            vim.cmd("vsplit")
          else
            vim.cmd("split")
          end
          vim.cmd("edit " .. node.absolute_path)
        end
      end
    end

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

    keymap.set(
      "n",
      "<leader>ev",
      open_nvim_tree_split("vsplit"),
      { silent = true, noremap = true, desc = "Open in vertical split" }
    )
    keymap.set(
      "n",
      "<leader>eh",
      open_nvim_tree_split("split"),
      { silent = true, noremap = true, desc = "Open in horizontal split" }
    )
  end,
}
