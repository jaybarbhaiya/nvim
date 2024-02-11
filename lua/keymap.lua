local keymap = vim.keymap

-- save current buffer
keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- copy to clipboard
keymap.set({'n', 'x'}, 'gy', '"+y')

-- paste from clipboard
keymap.set({'n', 'x'}, 'gp', '"+p')

-- delete text with out changing the internal registry (internal clipboard)
keymap.set({'n', 'x'}, 'x', '"_x')
keymap.set({'n', 'x'}, 'X', '"_d')

-- Select all text in the current buffer
keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- quit current buffer
keymap.set('n', '<leader>q', ':q<cr>')
