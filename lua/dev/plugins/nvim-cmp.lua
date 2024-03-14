return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- text in buffer
    "hrsh7th/cmp-path", -- file paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- autocompletion
    "rafamadriz/friendly-snippets", -- general snippets, (not required)
    "onsails/lspkind.nvim", -- icons
  },
  config = function()

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion ={
        completeopt = "menu,menuone,preview,noselect",
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- go to previous selection
        ["<C-j>"] = cmp.mapping.select_next_item(), -- go to next selection
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll up
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll down
        ["<C-Space>"] = cmp.mapping.complete(), -- open completion menu
        ["<C-e>"] = cmp.mapping.abort(), -- close completeion menu
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- accept selection
      }),

      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "copilot" },
        { name = "path" },
        { name = "luasnip" },
      }),

      formatting = {
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = {
            Copilot = "",
          },
        }),
      },

      experimental = {
        ghost_text = true,
      },
    })
  end,
}
