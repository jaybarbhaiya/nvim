-- variable, shorthand for config
local opt = vim.opt
local g = vim.g

-- enable line number
opt.number = true

-- enable mouse interaction
opt.mouse = 'a'

-- ignore case for search
opt.ignorecase = true
opt.smartcase = true

-- wrap
opt.wrap = true

-- Preserve indentation in virtual line
opt.breakindent = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4 -- mapping for << and >>

-- transform TAB to Space, default is false
opt.expandtab = true

-- use 'space' as leader key
g.mapleader = ' '

opt.autoindent = true
opt.cursorline = true
opt.autowrite = true

require("lua.keymap")
require("lua.lazy")
