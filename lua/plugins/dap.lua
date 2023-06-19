local dap = require("dap")
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "/opt/local/cpptools-osx-arm64/extension/debugAdapters/bin/OpenDebugAD7"
}
-- dap.adapters.codelldb = {
--     type = "server",
--     port = "${port}",
--     executable = {
--         -- CHANGE THIS to your path!
--         command = "/opt/local/codelldb-aarch64-darwin/extension/adapter/codelldb",
--         args = {"--port", "${port}"}

--         -- On windows you may have to uncomment this:
--         -- detached = false,
--     }
-- }

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = "${workspaceFolder}/build/Debug/src/problem01/problem01",
        cwd = "${workspaceFolder}",
        miDebuggerPath = "/opt/homebrew/Cellar/llvm/16.0.3/bin/lldb",
        stopAtEntry = true
    }, {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = "${workspaceFolder}/build/Debug/src/problem01/problem01"
    }
}
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "codelldb",
--         request = "launch",
--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
--                                 "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopOnEntry = false
--     }
-- }

vim.keymap.set("n", "<F1>", ":lua require'dap'.step_back()<CR>")
vim.keymap.set("n", "<F4>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B",
               ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp",
               ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<cr>")

require("nvim-dap-virtual-text").setup {
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    all_frames = true,
    only_first_definition = false,
    all_references = true,
    virt_text_win_col = 60
}

local dapui = require "dapui"

require("dapui").setup({
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
        -- Use a table to apply multiple mappings
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t"
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                {id = "scopes", size = 0.25}, "breakpoints", "stacks", "watches"
            },
            size = 40, -- 40 columns
            position = "left"
        }, {
            elements = {"repl", "console"},
            size = 0.25, -- 25% of total lines
            position = "bottom"
        }
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {close = {"q", "<Esc>"}}
    },
    windows = {indent = 1},
    render = {
        max_type_length = nil -- Can be integer or nil.
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

