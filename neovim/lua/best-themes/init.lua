local M = {}

local highlights = require("best-themes.highlights")
local syntax_support = require("best-themes.syntax_support")

local themes = {
  ["tokyo-night-enhanced"] = function()
    return require("best-themes.palettes.tokyo-night-enhanced")
  end,
  ["best-tokyo-night-enhanced"] = function()
    return require("best-themes.palettes.tokyo-night-enhanced")
  end,
  ["catppuccin-mocha"] = function()
    return require("best-themes.palettes.catppuccin-mocha")
  end,
  ["best-catppuccin-mocha"] = function()
    return require("best-themes.palettes.catppuccin-mocha")
  end,
}

local function ensure_after_in_rtp()
  local info = debug.getinfo(1, "S")
  if info and info.source and info.source:sub(1, 1) == "@" then
    local path = info.source:sub(2)
    local plugin_root = vim.fs.normalize(vim.fn.fnamemodify(path, ":p:h:h:h"))
    local after_dir = plugin_root .. "/after"
    if vim.fn.isdirectory(after_dir) == 1 then
      local rtp = vim.o.rtp
      if not rtp:find(after_dir, 1, true) then
        vim.opt.rtp:append(after_dir)
      end
    end
  end
end

function M.load(theme_name)
  local get_palette = themes[theme_name]
  if not get_palette then
    vim.notify("Best Themes: Unknown theme '" .. tostring(theme_name) .. "'", vim.log.levels.ERROR)
    return
  end

  ensure_after_in_rtp()
  local palette = get_palette()
  highlights.apply(palette)
  syntax_support.setup(palette)
end

function M.setup(opts)
  -- Placeholder for user configuration options if needed in future
end

return M
