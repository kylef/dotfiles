set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

set inccommand=nosplit

lua <<EOF
  require'lspconfig'.ansiblels.setup{}
  require'lspconfig'.bashls.setup{}
  require'lspconfig'.gopls.setup{}
  require'lspconfig'.pyright.setup{}
  require'lspconfig'.sourcekit.setup{}
  require'lspconfig'.terraformls.setup{}

  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
    }
  })
EOF
