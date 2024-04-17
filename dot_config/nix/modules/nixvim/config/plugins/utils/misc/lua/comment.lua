local ft = require 'Comment.ft'

-- set via metatable
-- -- kdl supports the stupid /- feature on nodes too..
ft.kdl = { '//%s', '/*%s*/' }

-- -- Multiple filetypes
-- ft({ "go", "rust" }, ft.get("c"))
-- ft({ "toml", "graphql" }, "#%s")
