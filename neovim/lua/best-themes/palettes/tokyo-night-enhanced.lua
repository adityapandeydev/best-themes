local palette = {
  -- UI / Chrome
  bg = "#0a0a0d",
  bg_dark = "#08080b",
  bg_float = "#14141b",
  bg_highlight = "#1e202e",
  bg_visual = "#515c7e",
  border = "#101014",
  fg = "#a9b1d6",
  fg_dark = "#787c99",
  fg_gutter = "#363b54",
  cursor = "#c0caf5",

  -- Syntax Semantics (Exact match with VS Code Best Theme - Tokyo Night Enhanced)
  keyword = "#bb9af7",          -- Declaration keywords (let, const, enum, struct)
  modifier = "#9d7cd8",         -- Visibility / modifiers (pub, mut)
  control_flow = "#89ddff",     -- Control flow keywords (for, in, if, else, while, break, continue, return, impl)
  fn_keyword = "#89ddff",       -- Function declaration keyword (fn, def, func, function)
  func = "#7aa2f7",             -- Functions, methods, calls (cornflower blue)
  func_builtin = "#7aa2f7",     -- Built-in functions
  type = "#50abc2",             -- Primitive and standard types (usize, f64, String, Result)
  type_name = "#50abc2",        -- Entity name type / enum / class
  string = "#85d0b7",           -- Strings (mint)
  string_escape = "#b4f9f8",    -- Escapes, regex
  number = "#c0768e",           -- Numbers, floats, ints
  boolean = "#c0768e",          -- Booleans
  constant = "#f7768e",         -- Constants, macros
  constant_builtin = "#c0768e", -- Builtin constants
  variable = "#27c6d5",         -- Normal variables, locals, fields (Cyan)
  variable_builtin = "#f7768e", -- self, this
  variable_special = "#f7768e", -- Special language variables
  parameter = "#e0687a",        -- Parameters
  property = "#73daca",         -- Object properties
  comment = "#444b6a",          -- Comments (slate navy, italic)
  comment_doc = "#646e9c",      -- Documentation comments
  operator = "#89ddff",         -- Operators, punctuation delimiters
  bracket = "#9abdf5",          -- Brackets, braces, parentheses
  tag = "#f7768e",              -- HTML / JSX tags
  attribute = "#a9b1d6",        -- Attributes

  -- Diagnostics
  error = "#db4b4b",
  warning = "#ffdb69",
  info = "#0db9d7",
  hint = "#41a6b5",
  git_add = "#85d0b7",
  git_change = "#7aa2f7",
  git_delete = "#f7768e",
}

return palette
