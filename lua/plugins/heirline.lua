return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    -- hide winbar
    opts.winbar = nil

    local status = require "astroui.status"
    opts.statusline[3] = status.component.file_info {
      filename = { modify = ":." },
      filetype = false,
    }
  end,
}
