local cmp = require 'cmp'

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- / ? search will populate with completion
-- but once again; don't have a binding set because they're in the command menu
-- cmp.setup.cmdline({ "/", "?" }, {
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- note: completion bindings are not enabled here either ; so mostly for hinting
-- TODO: theme wildmenu instead
-- cmp.setup.cmdline(":", {
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })
--
-- -- Set configuration for specific filetype.
-- cmp.setup.filetype("gitcommit", {
-- 	sources = cmp.config.sources({
-- 		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- })
