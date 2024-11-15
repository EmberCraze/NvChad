local debug_port = 5678
local host = "0.0.0.0"

local dap = require "dap"
dap.adapters.python = {
  type = "server",
  host = host,
  port = tonumber(debug_port),
}

dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    -- connect = {
    --   host = host,
    --   port = tonumber(debug_port),
    -- },
    mode = "remote",
    name = "Remote Attached Debugger",
    cwd = vim.fn.getcwd(),
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(), -- Wherever your Python code lives locally.
        remoteRoot = "/opt/project", -- Wherever your Python code lives in the container.
      },
    },
  },
}

local dapui = require "dapui"
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
