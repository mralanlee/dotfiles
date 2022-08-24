local telescope = require('telescope')
local config = require('telescope.config')

local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")
table.insert(vimgrep_arguments, "!node_modules/*")

telescope.setup{
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "ignore_case",
    }
  },
}
