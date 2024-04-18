require('compiler').setup {}
require('overseer').setup() -- dep
require('which-key').register({
  c = {
    r = { '<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>', 'Compiler Redo' },
    o = { '<cmd>CompilerOpen<cr>', 'Compiler Open' },
    O = { '<cmd>CompilerToggleResults<cr>', 'Compiler Toggle Results' },
    x = { '<cmd>CompilerStop<cr>', 'Compiler Stop' },
  },
}, { prefix = '<leader>' })
