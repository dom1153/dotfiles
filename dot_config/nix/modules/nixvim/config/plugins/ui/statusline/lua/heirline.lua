-- features to look for
-- buffer tabline
-- filneame
-- buftype
-- general vim info (run a vim instances
-- q mode (see noice)
-- lsp type

-- local StatusLine = {
-- 	{ ... },
-- 	{ ... },
-- 	{ ..., { ... }, { ... }, { ..., { ... }, { ..., { ... } } } },
-- }
--
-- local WinBar = { { ... }, { { ... }, { ... } } }
--
-- local TabLine = { { ... }, { ... }, { ... } }

require('heirline').setup {
  statusline = { ... },
  winbar = { ... },
  tabline = { ... },
  statuscolumn = { ... },
  opts = { ... },
}
