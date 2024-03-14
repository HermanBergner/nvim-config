return {
  "LunarVim/bigfile.nvim",
  config = function()
    require("bigfile").setup({
      filesize = 2, -- size in MB
      pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
      features = { -- features to disable
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    })
  end,
}
