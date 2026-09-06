# Best Themes — Neovim Plugin

This directory contains the standard Neovim colorscheme plugin for **Best Themes**.

All bundled themes are accessible via standard `:colorscheme <name>` commands from a single plugin installation.

---

## 📁 Directory Structure

```text
neovim/
├── colors/                    # Colorscheme entry points
│   ├── best-dark.lua          # :colorscheme best-dark
│   └── best-light.lua         # :colorscheme best-light
├── lua/
│   └── best-themes/           # Shared modules, palettes, and highlight builders
│       ├── init.lua
│       ├── palette.lua
│       └── highlights.lua
├── plugin/                    # Optional runtime startup commands
├── LICENSE                    # Plugin license
└── README.md                  # Neovim plugin documentation
```

---

## 📦 Installation with `lazy.nvim`

Because the Neovim plugin resides in the `neovim/` subdirectory within the `best-themes` repository, configure your `lazy.nvim` spec as follows:

### Option A: Local Development / Clone Path
```lua
{
  dir = "/path/to/best-themes/neovim",
  name = "best-themes",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("best-dark")
  end,
}
```

### Option B: Remote GitHub Repository with Subdirectory
When installing directly from GitHub, configure `lazy.nvim` using the `submodule` or packpath pattern:
```lua
{
  "adityapandeydev/best-themes",
  name = "best-themes",
  lazy = false,
  priority = 1000,
  init = function(plugin)
    -- Add the neovim subdirectory to the Neovim runtimepath
    vim.opt.rtp:prepend(plugin.dir .. "/neovim")
  end,
  config = function()
    vim.cmd.colorscheme("best-dark")
  end,
}
```

---

## 🎨 Theme Implementation Standard

Each colorscheme entry file under `neovim/colors/<theme-name>.lua` implements the canonical Neovim setup sequence:

```lua
vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "<theme-name>"

-- Apply highlights via modern Neovim API:
require("best-themes").load("<theme-name>")
```

### Modern Highlights API
All highlight groups are defined using `vim.api.nvim_set_hl(0, group, opts)` covering:
- Standard editor highlights (`Normal`, `NormalFloat`, `CursorLine`, `Visual`, `Pmenu`, etc.)
- Tree-sitter captures (`@keyword`, `@function`, `@string`, `@type`, `@variable`, etc.)
- LSP semantic tokens and diagnostics (`DiagnosticError`, `DiagnosticWarn`, `@lsp.type.*`, etc.)
