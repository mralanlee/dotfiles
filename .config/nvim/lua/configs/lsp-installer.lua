local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {
    automatic_installation = true,
  }
  server:setup(opts)
end)
