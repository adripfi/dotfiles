local catppuccin_opts = {
  flavour = "mocha",
  term_colors = true,
  -- Let Ghostty provide its configured background, opacity, and blur.
  transparent_background = true,
  custom_highlights = function(colors)
    return {
      Normal = { bg = "NONE" },
      NormalFloat = { bg = "NONE" },
      NormalNC = { bg = "NONE" },
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
