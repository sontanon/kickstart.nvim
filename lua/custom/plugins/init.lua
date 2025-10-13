-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_default_keybindings = 1
    end,
    keys = {
      { '<c-h>', '<cmd>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd>TmuxNavigateRight<cr>' },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 15,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
      }
      -- Keymap to toggle terminal in normal and insert mode
      vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
      vim.keymap.set('i', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
    end,
  },
  {
    'github/copilot.vim',
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true

      vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        silent = true,
        replace_keycodes = false,
      })

      vim.keymap.set('i', '<M-w>', '<Plug>(copilot-accept-word)', { silent = true })
      vim.keymap.set('i', '<M-l>', '<Plug>(copilot-accept-line)', { silent = true })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
    },
    build = 'make tiktoken',
    opts = {
      debug = false, -- Enable debugging
      model = 'gpt-5-mini',
    },
    keys = {
      { '<leader>cc', '<cmd>CopilotChat<cr>', desc = 'Copilot: Chat' },
      { '<leader>ce', '<cmd>CopilotChatExplain<cr>', desc = 'Copilot: Explain' },
      { '<leader>cf', '<cmd>CopilotChatFix<cr>', desc = 'Copilot: Fix' },
    },
  },
  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = true,
    keys = {
      {
        '<leader>gg',
        function() require('neogit').open() end,
        desc = 'Neogit: Open',
      },
    },
  },
}
