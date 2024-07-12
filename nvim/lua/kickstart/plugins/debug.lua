-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,
      automatic_installation = false,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'netcoredbg',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" }
        }
      },
      force_buffers = true,
      layouts = { {
          elements = { {
              id = "scopes",
              size = 0.25
            }, {
              id = "breakpoints",
              size = 0.25
            }, {
              id = "stacks",
              size = 0.25
            }, {
              id = "watches",
              size = 0.25
            } },
          position = "left",
          size = 40
        }, {
          elements = { {
              id = "repl",
              size = 0.5
            }, {
              id = "console",
              size = 0.5
            } },
          position = "bottom",
          size = 10
        } },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
      },
      render = {
        indent = 1,
        max_value_lines = 100
      }
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- dotnet
    dap.adapters.coreclr = {
      type = 'executable',
      command = 'netcoredbg',
      args = {'--interpreter=vscode'}
    }

      -- "name": ".NET Core Launch (api)",
      -- "type": "coreclr",
      -- "request": "launch",
      -- "preLaunchTask": "build API",
      -- "program": "${workspaceFolder}/cubi-api/bin/Debug/net8.0/cubi-api.dll",
      -- "args": [], // Add "local" override the local database connection string with the one in appsettings.local.json
      -- "cwd": "${workspaceFolder}/cubi-api",
      -- "stopAtEntry": false,
      -- "serverReadyAction": {
      --   "action": "openExternally",
      --   "pattern": "\\bNow listening on:\\s+(https?://\\S+)"
      -- },
      -- "env": {
      --   "ASPNETCORE_ENVIRONMENT": "Development"
      -- }

      -- return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.getcwd() .. '/bin/Debug/net8.0/cubi-api.dll'
        end,
        cwd = function()
            return vim.fn.getcwd()
        end,
        stopAtEntry = false,
        serverReadyAction = {
          action = 'openExternally',
          pattern = '\\bNow listening on:\\s+(https?://\\S+)',
        },
        env = {
          ASPNETCORE_ENVIRONMENT = function()
            return "Development"
          end,
          ASPNETCORE_URLS = function()
            return "http://localhost:5050"
          end,
        },
      },
    }

    -- GDScript
    dap.adapters.godot = {
      type = 'server',
      host = '127.0.0.1',
      port = 6006,
    }

    dap.configurations.gdscript = {
      {
        type = 'godot',
        request = 'launch', -- either "launch" or "attach"
        name = 'Launch Main Scene',
        -- specific to gdscript
        project = '${workspaceFolder}',
      }
    }
  end,
}
