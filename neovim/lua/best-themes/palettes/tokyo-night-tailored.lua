local palette = {
  -- UI / Chrome
  bg = "#0a0a0d",
  bg_dark = "#08080b",
  bg_float = "#14141b",
  bg_highlight = "#1e202e",
  bg_visual = "#283457",
  border = "#101014",
  fg = "#a9b1d6",
  fg_dark = "#787c99",
  fg_gutter = "#363b54",
  cursor = "#c0caf5",

  -- Syntax Semantics (Exact 1-to-1 match with VS Code Best Theme - Tokyo Night Tailored)
  keyword = "#bb9af7",          -- Declaration keywords (let, const, enum, struct)
  modifier = "#bb9af7",         -- Visibility / modifiers (pub, mut, async, static)
  control_flow = "#bb9af7",     -- Control flow keywords (for, in, if, else, while, break, continue, return)
  fn_keyword = "#89ddff",       -- Function declaration keyword (fn, def, func, function)
  func = "#7aa2f7",             -- Functions, methods, calls (cornflower blue)
  func_builtin = "#7aa2f7",     -- Built-in functions
  type = "#89ddff",             -- Types, classes, structs, traits (sky blue)
  type_name = "#89ddff",        -- Entity name type / enum / class
  string = "#85d0b7",           -- Strings (mint)
  string_escape = "#b4f9f8",    -- Escapes, regex
  number = "#c0768e",           -- Numbers, floats, ints
  boolean = "#c0768e",          -- Booleans
  constant = "#e0af68",         -- Constants, readonly variables, UPPER_CASE (warm amber)
  constant_builtin = "#c0768e", -- Builtin constants (true, false, nil)
  enum_member = "#ff9e64",      -- Enum variants / enum members (orange)
  variable = "#27c6d5",         -- Normal variables, locals, fields (cyan)
  variable_builtin = "#f7768e", -- self, this
  variable_special = "#89ddff", -- Special / built-in library variables
  parameter = "#e0687a",        -- Parameters (warm coral)
  property = "#27c6d5",         -- Object properties / fields
  comment = "#565f89",          -- Comments (slate navy, italic)
  comment_doc = "#646e9c",      -- Documentation comments
  operator = "#89ddff",         -- Operators, punctuation delimiters
  bracket = "#9abdf5",          -- Brackets, braces, parentheses
  tag = "#f7768e",              -- HTML / JSX tags
  attribute = "#c0768e",        -- Annotations / decorators / attributes (warm coral-pink)

  -- Diagnostics & Git
  error = "#db4b4b",
  warning = "#e0af68",
  info = "#0db9d7",
  hint = "#41a6b5",
  git_add = "#85d0b7",
  git_change = "#7aa2f7",
  git_delete = "#f7768e",
}

return palette
