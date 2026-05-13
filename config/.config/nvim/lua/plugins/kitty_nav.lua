return {
  "knubie/vim-kitty-navigator",
  init = function()
    local kitty_bin = "/Applications/kitty.app/Contents/MacOS"
    if not vim.env.PATH:find(kitty_bin, 1, true) then
      vim.env.PATH = kitty_bin .. ":" .. vim.env.PATH
    end
  end,
}
