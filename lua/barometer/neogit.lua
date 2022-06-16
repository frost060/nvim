local neogit = require "neogit"
local nnoremap = require("barometer.keymap").nnoremap

neogit.setup {}

nnoremap("<leader>gs", function()
  neogit.open {
    kind = "split_above",
  }
end)
