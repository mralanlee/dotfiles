return {
  "jake-stewart/jfind.nvim",
  config = function()
    require("jfind").setup({
      exclude = {
        ".git",
        "node_modules",
        ".idea",
        ".vscode",
        "build",
        "dist",
        "public"
      },
      border = "rounded",
      tmux = true,
    })
  end
}
