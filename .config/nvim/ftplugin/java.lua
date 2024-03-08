local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
  cmd = {
    'jdt-language-server',
    '-data',
    vim.fn.expand('$HOME/.cache/jdtls/') .. project_name,
  },

  root_dir = vim.fs.dirname(vim.fs.find({'pom.xml', '.git'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
