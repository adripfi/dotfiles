local catppuccin_opts = {
  flavour = "mocha",
  term_colors = true,
  color_overrides = {
    mocha = {
      base = "#000000",
      mantle = "#000000",
      crust = "#000000",
    },
  },
  custom_highlights = function(colors)
    return {
      Normal = { bg = "#000000" },
      NormalFloat = { bg = "#000000" },
      NormalNC = { bg = "#000000" },
      WinSeparator = { fg = colors.surface0 },
    }
  end,
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").setup(catppuccin_opts)
        vim.cmd.colorscheme("catppuccin")
      end,
    },
  },
}
