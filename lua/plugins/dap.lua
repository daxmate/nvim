vim.fn.sign_define("DapBreakpoint",
                   {text = "🛑", texthl = "", linehl = "", numhl = ""})
-- dap ui configrarion
local dap, dapui = require("dap"), require("dapui")
dapui.setup()

-- c++/c/rust
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        -- CHANGE THIS to your path!
        command = "/opt/local/codelldb-aarch64-darwin/extension/adapter/codelldb",
        args = {"--port", "${port}"}

        -- On windows you may have to uncomment this:
        -- detached = false,
    }
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
                                "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = true
    }
}


dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.set_log_level("DEBUG")
