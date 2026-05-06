return {
  "NLKNguyen/papercolor-theme",
  name = "papercolor",
  priority = 1000,
  config = function ()
    vim.o.background = "light"
    vim.cmd("colorscheme PaperColor")
  end
}
