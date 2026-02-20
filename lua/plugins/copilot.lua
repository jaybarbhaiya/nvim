return {
  "github/copilot.vim",
  event = "VimEnter",
  opts = {},
  config = function()
    -- Disable default Tab mapping to avoid conflicts
    vim.g.copilot_no_tab_map = true

    -- Enable Copilot automatically on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function() vim.cmd "Copilot enable" end,
    })

    -- Optional: Map <C-J> to accept Copilot suggestions in insert mode
    vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
  end,
}
