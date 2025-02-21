return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = false,
    },
    mappings = {
      reset = {
        normal = '<C-r>',
        insert = '<C-r>',
      },
    },
    keys = {
      {
        '<leader>cct',
        function()
          require('CopilotChat').toggle()
        end,
        desc = 'copilot: [t]oggle chat window',
      },
      {
        '<leader>ccc',
        function()
          local input = vim.fn.input 'General Question: '
          if input ~= '' then
            require('CopilotChat').ask(input)
          end
        end,
        desc = 'copilot: [c]hat',
      },
      {
        '<leader>c',
        function()
          local input = vim.fn.input 'General Question: '
          if input ~= '' then
            require('CopilotChat').ask(input)
          end
        end,
        mode = { 'v' },
        desc = 'copilot: [c]hat with selection',
      },
      {
        '<leader>ccb',
        function()
          local input = vim.fn.input 'Buffer Question: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = 'copilot: chat with current [b]uffer',
      },
      {
        '<leader>cca',
        function()
          local actions = require 'CopilotChat.actions'
          require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
        end,
        desc = 'copilot: [a]ctions',
      },
      {
        '<leader>a',
        function()
          local actions = require 'CopilotChat.actions'
          require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
        end,
        mode = { 'v' },
        desc = 'copilot: [a]ctions with selection',
      },
      {
        '<leader>cch',
        function()
          local actions = require 'CopilotChat.actions'
          require('CopilotChat.integrations.telescope').pick(actions.help_actions())
        end,
        desc = 'copilot: [h]elp',
      },
    },
  },
}
