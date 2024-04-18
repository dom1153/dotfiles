local makeit = require 'makeit'

makeit.setup {}

require('which-key').register({
  c = {
    o = { makeit.MakeitOpen, 'Makeit Open' },
    r = { makeit.MakeitRedo, 'Makeit again' },
    O = { makeit.MakeitToggleResults, 'Makeit Toggle Results' },
  },
}, { prefix = '<leader>' })
