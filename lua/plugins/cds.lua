-- SAP CAP CDS support
-- Requirements:
--   LSP:        npm i -g @sap/cds-lsp
--   Treesitter: run :TSInstall cds after startup, then copy queries:
--               git clone https://github.com/cap-js-community/tree-sitter-cds /tmp/tree-sitter-cds
--               cd /tmp/tree-sitter-cds && ./nvim/setup-nvim-treesitter.sh

---@type LazySpec
return {
  -- Filetype detection for .cds files
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = {
          cds = "cds",
        },
      },
    },
  },

  -- LSP: cds_lsp via nvim-lspconfig
  -- Install: npm i -g @sap/cds-lsp
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      servers = {
        "cds_lsp",
      },
      config = {
        cds_lsp = {
          settings = {
            cds = {
              validate = true,
            },
          },
        },
      },
    },
  },

  -- Treesitter: custom CDS parser
  -- Repo: https://github.com/cap-js-community/tree-sitter-cds
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.cds = {
        install_info = {
          url = "https://github.com/cap-js-community/tree-sitter-cds.git",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "cds",
      }

      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "cds",
      })
      return opts
    end,
  },
}
