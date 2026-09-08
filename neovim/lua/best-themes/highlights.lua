local M = {}

function M.apply(p)
  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- =========================================================================
  -- Window & Pane Background Differentiation
  -- =========================================================================
  -- Active editing window: Crisp background
  hl("Normal", { fg = p.fg, bg = p.bg })
  -- Inactive split panes: Automatically dim to darker tone
  hl("NormalNC", { fg = p.fg_dark, bg = p.bg_dark })

  -- Split dividers & sash borders
  hl("WinSeparator", { fg = p.border, bg = p.bg_dark })
  hl("VertSplit", { fg = p.border, bg = p.bg_dark })

  -- Floating windows & popups (modals, hover, completions)
  hl("NormalFloat", { fg = p.fg, bg = p.bg_float })
  hl("FloatBorder", { fg = p.border, bg = p.bg_float })
  hl("FloatTitle", { fg = p.type, bg = p.bg_float, bold = true })

  -- Cursor & line highlights
  hl("Cursor", { fg = p.bg, bg = p.cursor })
  hl("CursorLine", { bg = p.bg_highlight })
  hl("CursorColumn", { bg = p.bg_highlight })
  hl("ColorColumn", { bg = p.bg_highlight })

  -- Gutter & Line Numbers
  hl("LineNr", { fg = p.fg_gutter })
  hl("CursorLineNr", { fg = p.cursor or p.fg, bold = true })
  hl("SignColumn", { fg = p.fg_gutter, bg = p.bg })
  hl("FoldColumn", { fg = p.fg_gutter, bg = p.bg })
  hl("Folded", { fg = p.fg_dark, bg = p.bg_dark })

  -- Visual & Search
  hl("Visual", { bg = p.bg_visual })
  hl("VisualNOS", { bg = p.bg_visual })
  hl("Search", { fg = p.bg, bg = "#3d59a1" })
  hl("IncSearch", { fg = p.bg, bg = "#ff9e64" })

  -- Statusline (Darker pane)
  hl("StatusLine", { fg = p.fg_dark, bg = p.bg_dark })
  hl("StatusLineNC", { fg = p.fg_gutter, bg = p.bg_dark })

  -- Tabline
  hl("TabLine", { fg = p.fg_dark, bg = p.bg_dark })
  hl("TabLineFill", { bg = p.bg_dark })
  hl("TabLineSel", { fg = p.fg, bg = p.bg, bold = true })

  -- Popup Menu (Autocompletion)
  hl("Pmenu", { fg = p.fg, bg = p.bg_float })
  hl("PmenuSel", { fg = p.fg, bg = p.bg_highlight, bold = true })
  hl("PmenuSbar", { bg = p.bg_dark })
  hl("PmenuThumb", { bg = p.fg_gutter })

  -- =========================================================================
  -- Sidebars & Tool Panes (Darker tone matching VS Code Sidebars)
  -- =========================================================================
  -- NvimTree
  hl("NvimTreeNormal", { fg = p.fg_dark, bg = p.bg_dark })
  hl("NvimTreeNormalNC", { fg = p.fg_dark, bg = p.bg_dark })
  hl("NvimTreeEndOfBuffer", { fg = p.bg_dark, bg = p.bg_dark })
  hl("NvimTreeWinSeparator", { fg = p.border, bg = p.bg_dark })
  hl("NvimTreeRootFolder", { fg = p.keyword, bold = true })
  hl("NvimTreeFolderName", { fg = p.type })
  hl("NvimTreeOpenedFolderName", { fg = p.type, bold = true })

  -- NeoTree
  hl("NeoTreeNormal", { fg = p.fg_dark, bg = p.bg_dark })
  hl("NeoTreeNormalNC", { fg = p.fg_dark, bg = p.bg_dark })
  hl("NeoTreeEndOfBuffer", { fg = p.bg_dark, bg = p.bg_dark })
  hl("NeoTreeWinSeparator", { fg = p.border, bg = p.bg_dark })

  -- Trouble & Outline
  hl("TroubleNormal", { fg = p.fg_dark, bg = p.bg_dark })
  hl("TroubleNormalNC", { fg = p.fg_dark, bg = p.bg_dark })
  hl("OutlineNormal", { fg = p.fg_dark, bg = p.bg_dark })

  -- Telescope / Picker
  hl("TelescopeNormal", { fg = p.fg, bg = p.bg_float })
  hl("TelescopeBorder", { fg = p.border, bg = p.bg_float })
  hl("TelescopePromptNormal", { fg = p.fg, bg = p.bg_dark })
  hl("TelescopePromptBorder", { fg = p.border, bg = p.bg_dark })
  hl("TelescopePromptTitle", { fg = p.bg, bg = p.keyword, bold = true })
  hl("TelescopeResultsTitle", { fg = p.bg, bg = p.func, bold = true })
  hl("TelescopePreviewTitle", { fg = p.bg, bg = p.type, bold = true })

  -- =========================================================================
  -- Standard Vim Syntax Highlighting
  -- =========================================================================
  hl("Comment", { fg = p.comment, italic = true })
  hl("Constant", { fg = p.constant })
  hl("String", { fg = p.string })
  hl("Character", { fg = p.string })
  hl("Number", { fg = p.number })
  hl("Boolean", { fg = p.boolean })
  hl("Float", { fg = p.number })
  hl("Identifier", { fg = p.variable })
  hl("Function", { fg = p.func })
  hl("Statement", { fg = p.control_flow })
  hl("Conditional", { fg = p.control_flow })
  hl("Repeat", { fg = p.control_flow })
  hl("Label", { fg = p.control_flow })
  hl("Operator", { fg = p.operator })
  hl("Keyword", { fg = p.keyword })
  hl("Exception", { fg = p.control_flow })
  hl("PreProc", { fg = p.modifier })
  hl("Include", { fg = p.fn_keyword })
  hl("Define", { fg = p.keyword })
  hl("Macro", { fg = p.func_builtin })
  hl("Type", { fg = p.type })
  hl("StorageClass", { fg = p.modifier, italic = true })
  hl("Structure", { fg = p.keyword })
  hl("Typedef", { fg = p.type })
  hl("Special", { fg = p.operator })
  hl("SpecialChar", { fg = p.string_escape })
  hl("Delimiter", { fg = p.operator })
  hl("Error", { fg = p.error })
  hl("Todo", { fg = p.bg, bg = p.warning, bold = true })

  -- =========================================================================
  -- Modern Tree-sitter Groups (Exact 1-to-1 match with VS Code)
  -- =========================================================================
  -- Keywords & Modifiers
  hl("@keyword", { fg = p.keyword })
  hl("@keyword.modifier", { fg = p.modifier, italic = true })
  hl("@keyword.coroutine", { fg = p.modifier, italic = true })
  hl("@keyword.type", { fg = p.keyword })
  hl("@keyword.storage", { fg = p.keyword })
  hl("@keyword.control", { fg = p.control_flow })
  hl("@keyword.conditional", { fg = p.control_flow })
  hl("@keyword.repeat", { fg = p.control_flow })
  hl("@keyword.return", { fg = p.control_flow })
  hl("@keyword.exception", { fg = p.control_flow })
  hl("@keyword.break", { fg = p.control_flow })
  hl("@keyword.continue", { fg = p.control_flow })
  hl("@keyword.import", { fg = p.fn_keyword or p.operator })
  hl("@keyword.function", { fg = p.fn_keyword })
  hl("@storageclass", { fg = p.modifier, italic = true })
  hl("@type.qualifier", { fg = p.modifier, italic = true })

  -- Functions & Calls
  hl("@function", { fg = p.func })
  hl("@function.call", { fg = p.func })
  hl("@function.builtin", { fg = p.func_builtin })
  hl("@function.macro", { fg = p.func_builtin })
  hl("@function.method", { fg = p.func })
  hl("@function.method.call", { fg = p.func })
  hl("@constructor", { fg = p.func })

  -- Types & Structures
  hl("@type", { fg = p.type })
  hl("@type.builtin", { fg = p.type })
  hl("@type.definition", { fg = p.type_name })
  hl("@type.enum.variant", { fg = p.enum_member })

  -- Variables, Fields, Parameters
  hl("@variable", { fg = p.variable })
  hl("@variable.builtin", { fg = p.variable_builtin })
  hl("@variable.parameter", { fg = p.parameter })
  hl("@variable.member", { fg = p.property })
  hl("@property", { fg = p.property })

  -- Constants
  hl("@constant", { fg = p.constant })
  hl("@constant.builtin", { fg = p.constant_builtin })
  hl("@constant.macro", { fg = p.constant })
  hl("@variable.member.enum", { fg = p.enum_member })
  hl("@variable.other.constant", { fg = p.constant })

  -- Literals
  hl("@string", { fg = p.string })
  hl("@string.escape", { fg = p.string_escape })
  hl("@string.regex", { fg = p.string_escape })
  hl("@number", { fg = p.number })
  hl("@number.float", { fg = p.number })
  hl("@boolean", { fg = p.boolean })

  -- Operators & Punctuation
  hl("@operator", { fg = p.operator })
  hl("@punctuation.delimiter", { fg = p.operator })
  hl("@punctuation.bracket", { fg = p.bracket })
  hl("@punctuation.special", { fg = p.keyword })

  -- Comments & Attributes
  hl("@comment", { fg = p.comment, italic = true })
  hl("@comment.documentation", { fg = p.comment_doc, italic = true })
  hl("@attribute", { fg = p.attribute })
  hl("@annotation", { fg = p.attribute })

  -- Markup / HTML / JSX
  hl("@tag", { fg = p.tag })
  hl("@tag.attribute", { fg = p.attribute })
  hl("@tag.delimiter", { fg = p.operator })

  -- =========================================================================
  -- LSP Semantic Tokens (Unified 1-to-1 sync with VS Code Semantic Highlighting)
  -- =========================================================================
  hl("@lsp.type.parameter", { fg = p.parameter })
  hl("@lsp.type.variable", { fg = p.variable })
  hl("@lsp.type.property", { fg = p.property })
  hl("@lsp.type.enumMember", { fg = p.enum_member })
  hl("@lsp.type.function", { fg = p.func })
  hl("@lsp.type.method", { fg = p.func })
  hl("@lsp.type.class", { fg = p.type })
  hl("@lsp.type.struct", { fg = p.type })
  hl("@lsp.type.interface", { fg = p.type })
  hl("@lsp.type.enum", { fg = p.type })
  hl("@lsp.type.type", { fg = p.type })
  hl("@lsp.type.typeParameter", { fg = p.type })
  hl("@lsp.type.namespace", { fg = p.type })
  hl("@lsp.type.keyword", { fg = p.keyword })
  hl("@lsp.type.modifier", { fg = p.modifier, italic = true })
  hl("@lsp.type.macro", { fg = p.func_builtin })
  hl("@lsp.type.comment", { fg = p.comment, italic = true })
  hl("@lsp.type.string", { fg = p.string })
  hl("@lsp.type.number", { fg = p.number })
  hl("@lsp.type.boolean", { fg = p.boolean })

  -- Modifiers
  hl("@lsp.mod.readonly", { fg = p.constant })
  hl("@lsp.mod.constant", { fg = p.constant })
  hl("@lsp.mod.defaultLibrary", { fg = p.variable_special })
  hl("@lsp.typemod.variable.readonly", { fg = p.constant })
  hl("@lsp.typemod.property.readonly", { fg = p.constant })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.error })
  hl("DiagnosticWarn", { fg = p.warning })
  hl("DiagnosticInfo", { fg = p.info })
  hl("DiagnosticHint", { fg = p.hint })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = p.error })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.warning })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.info })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.hint })

  -- Git signs
  hl("GitSignsAdd", { fg = p.git_add })
  hl("GitSignsChange", { fg = p.git_change })
  hl("GitSignsDelete", { fg = p.git_delete })
end

return M
