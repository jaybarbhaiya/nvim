-- JavaScript / Node.js DAP configuration
-- Debug adapter: js-debug-adapter (vscode-js-debug) via Mason
-- Supports launching npm scripts from package.json

---@type LazySpec
return {
  -- Install js-debug-adapter via Mason
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "js" },
    },
  },

  -- DAP configurations for JavaScript/TypeScript
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"

      -- Register pwa-node adapter (js-debug-adapter is a DAP server, not an executable)
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "js-debug-adapter",
          args = { "${port}" },
        },
      }

      -- Helper: read package.json and return a list of script names
      local function get_package_json_scripts()
        local cwd = vim.fn.getcwd()
        local package_json_path = cwd .. "/package.json"
        local f = io.open(package_json_path, "r")
        if not f then
          vim.notify("No package.json found in " .. cwd, vim.log.levels.WARN)
          return {}
        end
        local content = f:read "*a"
        f:close()
        local ok, decoded = pcall(vim.json.decode, content)
        if not ok or not decoded or not decoded.scripts then
          vim.notify("Could not parse scripts from package.json", vim.log.levels.WARN)
          return {}
        end
        local scripts = {}
        for name, cmd in pairs(decoded.scripts) do
          table.insert(scripts, { name = name, cmd = cmd })
        end
        table.sort(scripts, function(a, b) return a.name < b.name end)
        return scripts
      end

      -- Helper: prompt user to pick an npm script, returns the script name
      local function pick_npm_script()
        local scripts = get_package_json_scripts()
        if #scripts == 0 then return nil end

        local labels = {}
        for _, s in ipairs(scripts) do
          table.insert(labels, s.name .. "  (" .. s.cmd .. ")")
        end

        local choice = nil
        vim.ui.select(labels, { prompt = "Select npm script to debug:" }, function(_, idx)
          if idx then choice = scripts[idx].name end
        end)
        return choice
      end

      -- Configurations for javascript and typescript
      for _, lang in ipairs { "javascript", "typescript" } do
        dap.configurations[lang] = dap.configurations[lang] or {}
        table.insert(dap.configurations[lang], {
          type = "pwa-node",
          request = "launch",
          name = "Debug npm script (package.json)",
          runtimeExecutable = "npm",
          runtimeArgs = function()
            local script = pick_npm_script()
            if not script then return {} end
            return { "run", script }
          end,
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          -- Don't resolve sourcemaps for node_modules
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        })
      end
    end,
  },
}
