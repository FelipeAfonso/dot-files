return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require 'iron.core'

      iron.setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            -- sh = {
            --   -- Can be a table or a function that
            --   -- returns a table (see below)
            --   command = { 'zsh' },
            -- },
            -- python = {
            --   command = { 'python3' }, -- or { "ipython", "--no-autoindent" }
            --   format = require('iron.fts.common').bracketed_paste_python,
            -- },
            typescript = {
              command = { 'deno' },
              -- format = require('iron.fts.common').bracketed_paste,
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require('iron.view').right(40),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set('n', '<c-p>', '<cmd>IronRepl<cr>')
      vim.keymap.set('n', '<c-p>r', '<cmd>IronRestart<cr>')
      vim.keymap.set('n', '<c-p>h', '<cmd>IronHide<cr>')
      vim.keymap.set('v', 'rr', iron.visual_send)
    end,
  },
}
