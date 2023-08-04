local global = require('core.global')
local utils = require('core.utils')

-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-cmdline",
--     "hrsh7th/cmp-nvim-lsp-signature-help",
--     "L3MON4D3/LuaSnip",
--     "saadparwaiz1/cmp_luasnip",
--
--   },
--   config = function()
--     local cmp = require("cmp")
--     local lspkind = require("lspkind")
--
--     cmp.setup({
--       formatting = {
--         format = lspkind.cmp_format({
--           with_text = false,
--           maxwidth = 50,
--           mode = "symbol",
--           -- Shows source of information in auto complete
--           menu = {
--             buffer = "BUF",
--             rg = "RG",
--             nvim_lsp = "LSP",
--             path = "PATH",
--           },
--         }),
--       },
--       snippet = {
--         expand = function(args)
--           require("luasnip").lsp_expand(args.body)
--         end,
--       },
--       window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--       },
--       mapping = {
--         ['<C-b>'] = cmp.mapping.scroll_docs( -4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<C-e>"] = cmp.mapping.close(),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function()
--           if cmp.visible() then
--             cmp.select_prev_item()
--           end
--         end, { "i", "s" }),
--       },
--       sources = {
--         { name = "nvim_lsp" },
--         { name = "nvim_lsp_signature_help" },
--         { name = "buffer",                 keyword_length = 5 },
--         { name = "luasnip" },
--         { name = "path" },
--         { name = "rg",                     keyword_length = 5 },
--       },
--     })
--
--     -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--     cmp.setup.cmdline("/", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = {
--         { name = "buffer" },
--       },
--     })
--
--     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--     cmp.setup.cmdline(":", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = cmp.config.sources({
--         { name = "path" },
--       }, {
--         { name = "cmdline" },
--       }),
--     })
--
--     -- Setup lspconfig.
--     local capabilities = require('cmp_nvim_lsp').default_capabilities()
--     -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--
--     vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--       virtual_text = true,
--       signs = true,
--       underline = true,
--       update_in_insert = true,
--     })
--
--     for _, lsp in pairs(global.language_servers) do
--       require('lspconfig')[lsp].setup {
--         on_attach = function(client, bufnr)
--           utils.custom_lsp_attach(client, bufnr)
--         end,
--         capabilities = capabilities
--       }
--     end
--   end,
-- }

return {
  "hrsh7th/nvim-cmp", -- The completion plugin
  dependencies = {
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    -- snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    "rcarriga/cmp-dap",
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local kind_icons = require("core.icons").kind

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()

    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    local winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel"
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    cmp.setup {
      enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
      end,
      view = {
        entries = "custom" -- can be "custom", "wildmenu" or "native"
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expandable() then
            cmp.close()
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            cmp.close()
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            cmp.select_next_item()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        max_width = 0,
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" }
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered(
          {
            winhighlight = winhighlight,
            scrollbar    = false
          }),
        documentation = cmp.config.window.bordered({ winhighlight = winhighlight }),
      }
    }

    -- Set configuration for git
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = "buffer" },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      })
    })

    cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
      sources = {
        { name = "dap" },
      },
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
    })

    for _, lsp in pairs(global.language_servers) do
      require('lspconfig')[lsp].setup {
        on_attach = function(client, bufnr)
          utils.custom_lsp_attach(client, bufnr)
        end,
        capabilities = capabilities
      }
    end
  end
}
