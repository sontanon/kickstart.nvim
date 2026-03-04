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
