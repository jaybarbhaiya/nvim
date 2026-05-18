return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.o.background = "light"
    vim.cmd.colorscheme "catppuccin"
    require("catppuccin").setup {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
    }
  end,
}
