-- Using Lazy
return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup {
        -- Set light or dark variant
        variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
        -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
        borderless_pickers = false,

        cache = false,

        highlights = {
          -- CursorLine = { bg = "#FEF8CB" },
          CursorLine = { bg = "none" },
        },
      }
      vim.cmd "colorscheme cyberdream"
    end,
  },
  -- -- Or with configuration
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup {
  --       -- ...
  --     }
  --
  --     vim.cmd "colorscheme github_light_high_contrast"
  --   end,
  -- },

  -- "navarasu/onedark.nvim",
  -- priority = 1000, -- make sure to load this before all the other start plugins
  -- config = function()
  --   -- require("onedark").setup {
  --   --   style = "light",
  --   -- }
  --   require("onedark").load()
  -- end,
}
