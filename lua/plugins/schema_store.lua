return {
  "b0o/SchemaStore.nvim",
  config = function()
    local schemastore = require "schemastore"
    require("lspconfig").yamlls.setup {
      settings = {
        yaml = {
          schemas = schemastore.yaml.schemas(),
        },
      },
    }
  end,
}
