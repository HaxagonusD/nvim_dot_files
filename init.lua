vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- the wildmenu is the autocomplete for commands
-- wilder.nvim just makes that better
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
wilder.set_option('renderer', wilder.popupmenu_renderer({
  -- highlighter applies highlighting to the candidates
  min_width = '100%', -- minimum height of the popupmenu, can also be a number
  max_height= '25%', -- to set a fixed height, set max_height to the same value
  reverse = 0,
  highlighter = wilder.basic_highlighter(),
}))

-- leap mappings
-- I went into this plugin's source code at ~/.local/share/nvim/lazy/leap.nvim/lua/leap/user.lua
-- and deleted the gs mapping becuase it keeps throwing an error message when I start nvim
-- about conflicts with the gs command. Not sure if it's nvChad or neovim itself
require('leap').create_default_mappings()



