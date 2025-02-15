local global = {}
global.language_servers = {
  "ansiblels",
  "bashls",
  "dockerls",
  "eslint",
  "gopls",
  "graphql",
  "jsonls",
  "ts_ls",
  "puppet",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "texlab",
  "terraformls",
  "tflint",
  "yamlls",
}

global.langs = {
  "bash",
  "c",
  "help",
  "dockerfile",
  "gitignore",
  "go",
  "graphql",
  "hcl",
  "javascript",
  "jq",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "rust",
  "ruby",
  "sql",
  "terraform",
  "typescript",
  "toml",
  "vim",
  "yaml",
  "zig",
}

global.mason_tools = {
  -- Formatter
  "prettier",
  "stylua",
  "hclfmt",
  "puppet-editor-services",
  "black",
  -- Linter
  "actionlint",
  "eslint_d",
  "shellcheck",
  "tflint",
  "vale",
  "yamllint",
  "terraform-ls"
  -- DAP
  -- "debugpy",
}

return global
