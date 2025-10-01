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
    'benlubas/molten-nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    build = ':MoltenUpdate',
    init = function()
      vim.g.molten_output_port = 3000
      vim.g.molten_image_port = 3001
    end,
    keys = {
      { '<leader>mi', '<cmd>MoltenInit python<cr>', desc = 'Molten: Initialize' },
      { '<leader>mR', '<cmd>MoltenRunAll<cr>', desc = 'Molten: Run All' },
      { '<leader>mr', '<cmd>MoltenRunCell<cr>', desc = 'Molten: Run Cell' },
      { '<leader>mo', '<cmd>MoltenShowOutput<cr>', desc = 'Molten: Show Output' },
      { '<leader>mp', '<cmd>MoltenShowOutput<cr>', desc = 'Molten: Show Plot' },
    },
  },
  {
    'github/copilot.vim',
    lazy = false,
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
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
    },
    keys = {
      { '<leader>cc', '<cmd>CopilotChat<cr>', desc = 'Copilot: Chat' },
      { '<leader>ce', '<cmd>CopilotChatExplain<cr>', desc = 'Copilot: Explain' },
      { '<leader>cf', '<cmd>CopilotChatFix<cr>', desc = 'Copilot: Fix' },
    },
  }
}

