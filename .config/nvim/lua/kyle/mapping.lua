local defaults = { noremap = true, silent = true }
vim.keymap.set('', '<leader>y', '"+y', defaults)
vim.keymap.set('', '<leader>Y', '"+y$', defaults)

vim.keymap.set('n', '<leader>p', '"+p', defaults)
vim.keymap.set('n', '<leader>P', '"+P', defaults)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }

    vim.keymap.set('n', '<Leader>k', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<Leader>K', vim.lsp.buf.signature_help, opts)

    -- refactoring
    --- rename
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)

    --- open code action menu
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)

    --- reformat file
    vim.keymap.set('n', '<Leader>m', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- movement
    --- goto definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    --- goto type definition
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)

    --- goto implementation
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    --- find references
    local telescope = require'telescope.builtin'
    vim.keymap.set('n', '<Leader>r', telescope.lsp_references)
  end,
})
