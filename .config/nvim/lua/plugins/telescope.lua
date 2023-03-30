return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
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
      defaults = {
        winblend = 0,
        set_env = { ['COLORTERM'] = 'truecolor' },
        color_devicons = true,
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      }
    })
  end,
}
