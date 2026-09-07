local M = {}

function M.apply(p)
  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor UI
  hl("Normal", { fg = p.fg, bg = p.bg })
  hl("NormalFloat", { fg = p.fg, bg = p.bg_float })
  hl("FloatBorder", { fg = p.border, bg = p.bg_float })
  hl("Cursor", { fg = p.bg, bg = p.cursor })
  hl("CursorLine", { bg = p.bg_highlight })
  hl("CursorColumn", { bg = p.bg_highlight })
  hl("ColorColumn", { bg = p.bg_highlight })
  hl("LineNr", { fg = p.fg_gutter })
  hl("CursorLineNr", { fg = "#737aa2", bold = true })
  hl("Visual", { bg = p.bg_visual })
  hl("VisualNOS", { bg = p.bg_visual })
  hl("Search", { fg = p.bg, bg = "#3d59a1" })
  hl("IncSearch", { fg = p.bg, bg = "#ff9e64" })
  hl("StatusLine", { fg = p.fg_dark, bg = p.bg_dark })
  hl("StatusLineNC", { fg = p.fg_gutter, bg = p.bg_dark })
  hl("VertSplit", { fg = p.border, bg = p.bg })
  hl("WinSeparator", { fg = p.border, bg = p.bg })
  hl("Folded", { fg = p.fg_dark, bg = p.bg_dark })
  hl("FoldColumn", { fg = p.fg_gutter, bg = p.bg })
  hl("SignColumn", { fg = p.fg_gutter, bg = p.bg })

  -- Popup Menu
  hl("Pmenu", { fg = p.fg, bg = p.bg_float })
  hl("PmenuSel", { fg = "#ffffff", bg = "#3d59a1", bold = true })
  hl("PmenuSbar", { bg = p.bg_dark })
  hl("PmenuThumb", { bg = p.fg_gutter })

  -- Tabs
  hl("TabLine", { fg = p.fg_dark, bg = p.bg_dark })
  hl("TabLineSel", { fg = p.fg, bg = p.bg, bold = true })
  hl("TabLineFill", { bg = p.bg_dark })

  -- Standard Vim Syntax
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
  hl("PreProc", { fg = "#73daca" })
  hl("Include", { fg = p.fn_keyword })
  hl("Define", { fg = p.keyword })
  hl("Macro", { fg = p.func_builtin })
  hl("Type", { fg = p.type })
  hl("StorageClass", { fg = p.modifier })
  hl("Structure", { fg = p.type })
  hl("Typedef", { fg = p.type })
  hl("Special", { fg = p.operator })
  hl("SpecialChar", { fg = p.string_escape })
  hl("Delimiter", { fg = p.operator })
  hl("Error", { fg = p.error })
  hl("Todo", { fg = p.bg, bg = p.warning, bold = true })

  -- Language-Specific Fallback Syntax Groups (When Tree-sitter is off)
  -- Attributes (#![allow...], #[repr...]) -> Clean text/foreground, NOT green!
  hl("rustAttribute", { fg = p.fg })
  hl("rustDerive", { fg = p.type })
  hl("rustDeriveTrait", { fg = p.type })
  hl("rustEnumVariant", { fg = "#73daca" })
  hl("rustEnumVariantIdent", { fg = "#73daca" })
  hl("rustModPath", { fg = p.type })
  hl("rustStructure", { fg = p.modifier }) -- struct, enum in purple, not orange
  hl("rustStorage", { fg = p.modifier, italic = false }) -- const, static in purple, NOT italic
  hl("rustPubModifier", { fg = p.modifier, italic = true }) -- pub in purple italic
  hl("rustMutModifier", { fg = p.modifier, italic = true }) -- mut in purple italic
  hl("rustLetModifier", { fg = p.keyword, italic = false }) -- let in purple (not italic)
  hl("rustPubModifierHL", { link = "rustPubModifier" })
  hl("rustMutModifierHL", { link = "rustMutModifier" })
  hl("rustLetModifierHL", { link = "rustLetModifier" })
  hl("rustCapsIdent", { fg = p.constant }) -- MAX_NAME_LEN in warm coral/orange
  hl("rustSkyKeywords", { fg = p.control_flow }) -- fn, impl, for, in, if, while, return in sky blue
  hl("rustFuncCall", { fg = p.func })
  hl("rustMethodCall", { fg = p.func })

  -- Zig Fallback Syntax
  hl("zigCapsIdent", { fg = p.constant })
  hl("zigStorage", { fg = p.modifier, italic = false })
  hl("zigPubModifier", { fg = p.modifier, italic = true })
  hl("zigSkyKeywords", { fg = p.control_flow })
  hl("zigBuiltin", { fg = "#73daca" })
  hl("zigFuncCall", { fg = p.func })

  -- C and C++ Fallback Syntax
  hl("cppCapsIdent", { fg = p.constant })
  hl("cppStorage", { fg = p.modifier, italic = false })
  hl("cppModifier", { fg = p.modifier, italic = true })
  hl("cppSkyKeywords", { fg = p.control_flow })
  hl("cInclude", { fg = p.control_flow })
  hl("cDefine", { fg = p.modifier })
  hl("cFuncCall", { fg = p.func })

  -- Java Fallback Syntax
  hl("javaCapsIdent", { fg = p.constant })
  hl("javaConstant", { fg = p.constant })
  hl("javaModifier", { fg = p.modifier, italic = true })
  hl("javaScopeDecl", { fg = p.modifier, italic = true })
  hl("javaStorageClass", { fg = p.modifier, italic = true })
  hl("javaSkyKeywords", { fg = p.control_flow })
  hl("javaConditional", { fg = p.control_flow })
  hl("javaRepeat", { fg = p.control_flow })
  hl("javaBranch", { fg = p.control_flow })
  hl("javaStatement", { fg = p.control_flow })
  hl("javaMethodCall", { fg = p.func })

  -- Go Fallback Syntax
  hl("goCapsIdent", { fg = p.constant })
  hl("goStorage", { fg = p.modifier, italic = false })
  hl("goSkyKeywords", { fg = p.control_flow })
  hl("goFuncCall", { fg = p.func })

  -- TypeScript / JavaScript Fallback Syntax
  hl("tsCapsIdent", { fg = p.constant })
  hl("tsStorage", { fg = p.modifier, italic = false })
  hl("tsModifier", { fg = p.modifier, italic = true })
  hl("tsSkyKeywords", { fg = p.control_flow })
  hl("tsFuncCall", { fg = p.func })

  -- Python Fallback Syntax
  hl("pythonCapsIdent", { fg = p.constant })
  hl("pythonSkyKeywords", { fg = p.control_flow })
  hl("pythonModifier", { fg = p.modifier, italic = true })
  hl("pythonFuncCall", { fg = p.func })

  -- Gleam Fallback Syntax
  hl("gleamCapsIdent", { fg = p.constant })
  hl("gleamPubModifier", { fg = p.modifier, italic = true })
  hl("gleamStorage", { fg = p.modifier, italic = false })
  hl("gleamSkyKeywords", { fg = p.control_flow })
  hl("gleamFuncCall", { fg = p.func })

  -- Modern Tree-sitter Groups
  -- Modifiers (pub, mut, async, static) - Lavender Purple & Italic
  hl("@keyword.modifier", { fg = p.modifier, italic = true })
  hl("@type.qualifier", { fg = p.modifier, italic = true })
  hl("@storageclass", { fg = p.modifier })
  hl("@keyword.storage", { fg = p.modifier })

  -- Attributes & Annotations - Clean text, NOT green
  hl("@attribute", { fg = p.fg })
  hl("@annotation", { fg = p.fg })

  -- Control Flow Statements (for, if, while, break, continue, return) - Sky Blue
  hl("@keyword.control", { fg = p.control_flow })
  hl("@keyword.conditional", { fg = p.control_flow })
  hl("@keyword.repeat", { fg = p.control_flow })
  hl("@keyword.return", { fg = p.control_flow, italic = true })
  hl("@keyword.exception", { fg = p.control_flow })
  hl("@keyword.break", { fg = p.control_flow })
  hl("@keyword.continue", { fg = p.control_flow })

  -- Declarations & Construct Keywords
  hl("@keyword", { fg = p.keyword })
  hl("@keyword.import", { fg = "#7dcfff" })
  hl("@keyword.function", { fg = p.fn_keyword })

  -- Functions & Methods - Soft Cornflower Blue
  hl("@function", { fg = p.func })
  hl("@function.call", { fg = p.func })
  hl("@function.builtin", { fg = p.func_builtin })
  hl("@function.macro", { fg = p.func_builtin })
  hl("@function.method", { fg = p.func })
  hl("@function.method.call", { fg = p.func })
  hl("@constructor", { fg = p.func })

  -- Types & Classes
  hl("@type", { fg = p.type })
  hl("@type.builtin", { fg = p.type })
  hl("@type.definition", { fg = p.type_name })

  -- Variables & Parameters
  hl("@variable", { fg = p.variable })
  hl("@variable.builtin", { fg = p.variable_special })
  hl("@variable.parameter", { fg = p.parameter })
  hl("@variable.member", { fg = p.variable })
  hl("@property", { fg = p.property })

  -- Constants, Enum Members, ALL_CAPS
  hl("@constant", { fg = p.constant })
  hl("@constant.builtin", { fg = p.constant_builtin })
  hl("@type.enum.variant", { fg = p.variable })
  hl("@variable.member.enum", { fg = p.variable })
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

  -- Comments
  hl("@comment", { fg = p.comment, italic = true })
  hl("@comment.documentation", { fg = p.comment_doc, italic = true })

  -- HTML / JSX / Tags
  hl("@tag", { fg = p.tag })
  hl("@tag.attribute", { fg = p.attribute })
  hl("@tag.delimiter", { fg = p.operator })

  -- LSP Semantic Tokens (Unified 1-to-1 with Tree-sitter)
  hl("@lsp.type.class", { link = "@type" })
  hl("@lsp.type.decorator", { link = "@function" })
  hl("@lsp.type.enum", { link = "@type" })
  hl("@lsp.type.enumMember", { link = "@constant" })
  hl("@lsp.type.function", { link = "@function" })
  hl("@lsp.type.interface", { link = "@type" })
  hl("@lsp.type.macro", { link = "@function.macro" })
  hl("@lsp.type.method", { link = "@function.method" })
  hl("@lsp.type.namespace", { link = "@type" })
  hl("@lsp.type.parameter", { link = "@variable.parameter" })
  hl("@lsp.type.property", { link = "@property" })
  hl("@lsp.type.struct", { link = "@type" })
  hl("@lsp.type.type", { link = "@type" })
  hl("@lsp.type.typeParameter", { link = "@type" })
  hl("@lsp.type.variable", { link = "@variable" })
  hl("@lsp.type.modifier", { link = "@keyword.modifier" })
  hl("@lsp.mod.readonly", { link = "@constant" })

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
