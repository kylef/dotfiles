local defaults = { noremap = true, silent = true }
vim.keymap.set('', '<leader>y', '"+y', defaults)
vim.keymap.set('', '<leader>Y', '"+y$', defaults)

vim.keymap.set('n', '<leader>p', '"+p', defaults)
vim.keymap.set('n', '<leader>P', '"+P', defaults)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set('n', '<Leader>k', vim.lsp.buf.hover, opts)

    -- refactoring
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<Leader>m', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- goto
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    -- find
    local telescope = require'telescope.builtin'
    vim.keymap.set('n', '<Leader>r', telescope.lsp_references)
  end,
})
