vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "tokyo-night-tailored"

require("best-themes").load("tokyo-night-tailored")
