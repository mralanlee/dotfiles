local telescope = require('telescope')

telescope.setup{
  pickers = {
    find_files = {
      theme = "dropdown"
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
