return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
} -- return {
--   { "navarasu/onedark.nvim", opts = { style = "darker" } },
--   {
--     "catppuccin/nvim",
--     require("catppuccin").setup({
--       custom_highlights = function(colors)
--         return {
--           FlashLabel = { fg = "#1b1d2b", bg = colors.blue },
--         }
--       end,
--     }),
--     lazy = true,
--     name = "catppuccin",
--     opts = {
--       term_colors = true,
--       integrations = {
--         aerial = true,
--         alpha = true,
--         cmp = true,
--         dashboard = true,
--         flash = true,
--         gitsigns = true,
--         headlines = true,
--         illuminate = true,
--         indent_blankline = { enabled = true },
--         leap = true,
--         lsp_trouble = true,
--         mason = true,
--         markdown = true,
--         mini = true,
--         native_lsp = {
--           enabled = true,
--           underlines = {
--             errors = { "undercurl" },
--             hints = { "undercurl" },
--             warnings = { "undercurl" },
--             information = { "undercurl" },
--           },
--         },
--         navic = { enabled = true, custom_bg = "lualine" },
--         neotest = true,
--         neotree = true,
--         noice = true,
--         notify = true,
--         semantic_tokens = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--         which_key = true,
--       },
--       specs = {
--         {
--           "akinsho/bufferline.nvim",
--           optional = true,
--           opts = function(_, opts)
--             if (vim.g.colors_name or ""):find("catppuccin") then
--               opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
--             end
--           end,
--         },
--       },
--       color_overrides = {
--         mocha = {
--           base = "#1E1E2E",
--           mantle = "#1E1E2E",
--           crust = "#1E1E2E",
--         },
--       },
--     },
--   },
--
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }
