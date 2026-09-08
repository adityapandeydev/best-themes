local palette = {
  -- UI / Chrome
  bg = "#1e1e2e",               -- Base: Active editing window
  bg_dark = "#181825",          -- Mantle: Inactive splits, sidebar, file tree, statusline
  bg_float = "#11111b",         -- Crust: Floating dialogs, popups
  bg_highlight = "#313244",     -- Surface0: Line highlights
  bg_visual = "#45475a",        -- Surface1: Visual selection
  border = "#313244",           -- Separators & window borders
  fg = "#cdd6f4",               -- Text
  fg_dark = "#a6adc8",          -- Subtext0: Muted labels
  fg_gutter = "#585b70",        -- Surface2: Line numbers
  cursor = "#f5e0dc",           -- Rosewater: Cursor

  -- Syntax Semantics (Exact 1-to-1 match with VS Code Best Theme - Catppuccin Mocha Tailored)
  keyword = "#cba6f7",          -- Mauve: Declarations, storage, modifiers
  modifier = "#cba6f7",         -- Mauve italic: Visibility, mut, pub, async
  control_flow = "#cba6f7",     -- Mauve: Control flow (if, else, for, while, return)
  fn_keyword = "#cba6f7",       -- Mauve: Function keyword (fn, def, func)
  func = "#89b4fa",             -- Blue: Functions, methods, calls
  func_builtin = "#89b4fa",     -- Blue: Built-in functions
  type = "#f9e2af",             -- Yellow: Types, classes, structs, traits
  type_name = "#f9e2af",        -- Yellow: Type definitions
  string = "#a6e3a1",           -- Green: Strings
  string_escape = "#f5c2e7",    -- Pink: Escape sequences, regex
  number = "#fab387",           -- Peach: Numbers, floats, ints
  boolean = "#fab387",          -- Peach: Booleans
  constant = "#f2cdcd",         -- Flamingo: Constants, readonly variables, UPPER_CASE
  constant_builtin = "#fab387", -- Peach: Built-in constants (true, false, nil)
  enum_member = "#f2cdcd",      -- Flamingo: Enum variants / enum members
  variable = "#74c7ec",         -- Sapphire: Normal variables, locals, fields
  variable_builtin = "#f38ba8", -- Red: self, this
  variable_special = "#f9e2af", -- Yellow: Built-in library types/variables
  parameter = "#eba0ac",        -- Maroon: Parameters
  property = "#74c7ec",         -- Sapphire: Object properties / fields
  comment = "#6c7086",          -- Overlay0: Comments (italic)
  comment_doc = "#7f849c",      -- Overlay1: Doc comments
  operator = "#89dceb",         -- Sky: Operators, punctuation delimiters
  bracket = "#9399b2",          -- Overlay2: Brackets, braces, parentheses
  tag = "#f38ba8",              -- Red: HTML / JSX tags
  attribute = "#cdd6f4",        -- Text: Attributes

  -- Diagnostics & Git
  error = "#f38ba8",            -- Red
  warning = "#f9e2af",          -- Yellow
  info = "#89dceb",             -- Sky
  hint = "#94e2d5",             -- Teal
  git_add = "#a6e3a1",          -- Green
  git_change = "#89b4fa",       -- Blue
  git_delete = "#f38ba8",       -- Red
}

return palette
