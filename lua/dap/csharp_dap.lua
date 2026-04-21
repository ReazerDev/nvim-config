local dap = require('dap')

-- 1. Configure the Debug Adapter (netcoredbg)
dap.adapters.coreclr = {
    type = 'executable',
    command = 'C:\\Users\\Sauer\\netcoredbg\\netcoredbg.exe',
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        type = 'coreclr',
        name = 'Launch .NET Web App (Converted)',
        request = 'launch',
        
        -- 💡 CRITICAL: The program MUST resolve to the compiled DLL path.
        -- This function attempts to find the standard output location, but you
        -- may need to run `dotnet build` first!
        program = function()
            local project_dir = vim.fn.getcwd()
            -- Automatically find any dll in bin/Debug/net6.0/
            local executables = vim.fn.glob(project_dir .. '/BOP/bin/Debug/net6.0/*.dll', false, true)
            if #executables == 0 then
                return vim.fn.input('Path to dll: ', project_dir .. '/bin/Debug/', 'file')
            end
            return executables[1]
        end,

        -- ➡️ Environment Variables
        env = {
            ASPNETCORE_ENVIRONMENT = 'Development',
            ASPNETCORE_HTTPS_PORT = '5001',
        },
        
        -- ➡️ Working Directory
        cwd = '${workspaceFolder}/BOP', -- This maps to "$(ProjectDir)"
        
        -- ➡️ Command Line Arguments (Omitted 'watch run --verbose')
        -- These arguments are for the application, not the 'dotnet' command.
        args = {}, -- You can add arguments specific to your application if needed.

        -- ➡️ Debugger Behavior
        stopAtEntry = false,

        -- ➡️ Console/Terminal configuration
        -- Use 'integratedTerminal' for interactive console apps, or 'internalConsole'
        console = 'integratedTerminal',
    },
    {
        type = "coreclr",
        name = "Attach to .NET Process",
        request = "attach",
        processId = require('dap.utils').pick_process,
    }
}

-- Optional: Set keymaps for debugging actions
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'Start/Continue Debugger' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Step Out' })
vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle DAP REPL' })
vim.keymap.set('n', '<leader>dh', require('dap.ui.widgets').hover, { desc = 'DAP Hover' })