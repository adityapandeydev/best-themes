vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "best-tokyo-night-enhanced"

require("best-themes").load("best-tokyo-night-enhanced")
