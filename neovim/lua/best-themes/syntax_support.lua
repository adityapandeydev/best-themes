local M = {}

local syntax_definitions = {
  rust = [[
    " Attributes: white / text foreground (never green)
    hi! rustAttribute guifg=#a9b1d6

    " Modifiers: pub, mut, let in lavender purple italic
    syn keyword rustPubModifier pub
    syn keyword rustMutModifier mut
    syn keyword rustLetModifier let
    hi! rustPubModifier guifg=#bb9af7 gui=italic cterm=italic
    hi! rustMutModifier guifg=#bb9af7 gui=italic cterm=italic
    hi! rustLetModifier guifg=#bb9af7 gui=italic cterm=italic

    " const & static: purple, NOT italic
    hi! rustStorage guifg=#bb9af7 gui=NONE

    " Structure: enum & struct in purple
    hi! rustStructure guifg=#bb9af7 gui=NONE

    " Constant variables: ALL_CAPS in Tokyo Night Red (#f7768e)
    syn match rustCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! rustCapsIdent guifg=#f7768e

    " Declaration & control keywords: fn, impl, for, if in sky blue
    syn keyword rustSkyKeywords fn impl for in if else while loop break continue return
    hi! rustSkyKeywords guifg=#89ddff

    " Enum variants in declarations (Tokyo Night Red)
    syn match rustEnumVariantIdent display "\<[A-Z][a-zA-Z0-9_]*\ze\s*\(=\|,\|\n\)"
    hi! rustEnumVariantIdent guifg=#f7768e

    " Function and method calls in soft blue
    syn match rustFuncCall display "\<\h\w*\ze\s*("
    syn match rustMethodCall display "\.\zs\h\w*\ze\s*("
    hi! rustFuncCall guifg=#7aa2f7
    hi! rustMethodCall guifg=#7aa2f7

    " Types and Traits
    hi! rustType guifg=#0db9d7
    hi! rustDeriveTrait guifg=#0db9d7
    hi! rustTrait guifg=#0db9d7
    hi! rustEnum guifg=#0db9d7
  ]],

  zig = [[
    " Modifiers: pub in purple italic
    syn keyword zigPubModifier pub
    hi! zigPubModifier guifg=#bb9af7 gui=italic cterm=italic

    " const & var: purple, NOT italic
    syn keyword zigStorage const var
    hi! zigStorage guifg=#bb9af7 gui=NONE

    " Constant variables in Tokyo Night Red (#f7768e)
    syn match zigCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! zigCapsIdent guifg=#f7768e

    " Control flow keywords in sky blue
    syn keyword zigSkyKeywords fn for while if else break continue return
    hi! zigSkyKeywords guifg=#89ddff

    " Built-ins in teal
    syn match zigBuiltin display "@\h\w*"
    hi! zigBuiltin guifg=#73daca

    " Function and method calls
    syn match zigFuncCall display "\<\h\w*\ze\s*("
    syn match zigMethodCall display "\.\zs\h\w*\ze\s*("
    hi! zigFuncCall guifg=#7aa2f7
    hi! zigMethodCall guifg=#7aa2f7
  ]],

  c = [[
    " Constants in Tokyo Night Red (#f7768e)
    syn match cppCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! cppCapsIdent guifg=#f7768e

    " Storage: const, static, constexpr in purple, NOT italic
    syn keyword cppStorage const static constexpr
    hi! cppStorage guifg=#bb9af7 gui=NONE

    " Modifiers in purple italic
    syn keyword cppModifier inline volatile
    hi! cppModifier guifg=#bb9af7 gui=italic cterm=italic

    " Control flow keywords in sky blue
    syn keyword cppSkyKeywords for while if else do switch case break continue return
    hi! cppSkyKeywords guifg=#89ddff

    " Preprocessor
    hi! cInclude guifg=#89ddff
    hi! cDefine guifg=#bb9af7
    hi! cPreProc guifg=#89ddff

    " Function calls
    syn match cFuncCall display "\<\h\w*\ze\s*("
    syn match cMethodCall display "\(\.\|->\)\zs\h\w*\ze\s*("
    hi! cFuncCall guifg=#7aa2f7
    hi! cMethodCall guifg=#7aa2f7
  ]],

  cpp = [[
    " Constants in Tokyo Night Red (#f7768e)
    syn match cppCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! cppCapsIdent guifg=#f7768e

    " Storage: const, static, constexpr in purple, NOT italic
    syn keyword cppStorage const static constexpr
    hi! cppStorage guifg=#bb9af7 gui=NONE

    " Modifiers in purple italic
    syn keyword cppModifier public private protected virtual explicit inline volatile
    hi! cppModifier guifg=#bb9af7 gui=italic cterm=italic

    " Control flow keywords in sky blue
    syn keyword cppSkyKeywords for while if else do switch case break continue return
    hi! cppSkyKeywords guifg=#89ddff

    " Preprocessor
    hi! cInclude guifg=#89ddff
    hi! cDefine guifg=#bb9af7
    hi! cPreProc guifg=#89ddff

    " Function calls
    syn match cFuncCall display "\<\h\w*\ze\s*("
    syn match cMethodCall display "\(\.\|->\)\zs\h\w*\ze\s*("
    hi! cFuncCall guifg=#7aa2f7
    hi! cMethodCall guifg=#7aa2f7
  ]],

  java = [[
    " Constants and Enum identifiers in Tokyo Night Red (#f7768e)
    syn match javaCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! javaCapsIdent guifg=#f7768e

    " Normal variables in Teal/Green (#73daca)
    syn match javaVarIdent display "\<[a-z][a-zA-Z0-9_]*\>"
    hi! javaVarIdent guifg=#73daca

    " Modifiers in purple italic
    syn keyword javaModifier public private protected static final synchronized volatile abstract
    hi! javaModifier guifg=#bb9af7 gui=italic cterm=italic
    hi! javaScopeDecl guifg=#bb9af7 gui=italic cterm=italic
    hi! javaStorageClass guifg=#bb9af7 gui=italic cterm=italic

    " Control flow keywords in sky blue
    syn keyword javaSkyKeywords for while if else do switch case break continue return
    hi! javaSkyKeywords guifg=#89ddff

    " Method calls
    syn match javaMethodCall display "\.\zs\h\w*\ze\s*("
    hi! javaMethodCall guifg=#7aa2f7
  ]],

  go = [[
    " Storage: const & var in purple, NOT italic
    syn keyword goStorage const var
    hi! goStorage guifg=#bb9af7 gui=NONE

    " Constants in Tokyo Night Red (#f7768e)
    syn match goCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! goCapsIdent guifg=#f7768e

    " Control flow in sky blue
    syn keyword goSkyKeywords func for range if else switch case select return break continue
    hi! goSkyKeywords guifg=#89ddff

    " Function and method calls
    syn match goFuncCall display "\<\h\w*\ze\s*("
    syn match goMethodCall display "\.\zs\h\w*\ze\s*("
    hi! goFuncCall guifg=#7aa2f7
    hi! goMethodCall guifg=#7aa2f7
  ]],

  typescript = [[
    " Storage: const in purple NOT italic
    syn keyword tsStorage const
    syn keyword tsModifier let export import async static public private protected readonly
    hi! tsStorage guifg=#bb9af7 gui=NONE
    hi! tsModifier guifg=#bb9af7 gui=italic cterm=italic

    " Constants in Tokyo Night Red (#f7768e)
    syn match tsCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! tsCapsIdent guifg=#f7768e

    " Control flow in sky blue
    syn keyword tsSkyKeywords function for of in if else while switch case break continue return
    hi! tsSkyKeywords guifg=#89ddff

    " Function & method calls
    syn match tsFuncCall display "\<\h\w*\ze\s*("
    syn match tsMethodCall display "\.\zs\h\w*\ze\s*("
    hi! tsFuncCall guifg=#7aa2f7
    hi! tsMethodCall guifg=#7aa2f7
  ]],

  javascript = [[
    " Storage: const in purple NOT italic
    syn keyword jsStorage const
    syn keyword jsModifier let export import async static readonly
    hi! jsStorage guifg=#bb9af7 gui=NONE
    hi! jsModifier guifg=#bb9af7 gui=italic cterm=italic

    " Constants in Tokyo Night Red (#f7768e)
    syn match jsCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! jsCapsIdent guifg=#f7768e

    " Control flow in sky blue
    syn keyword jsSkyKeywords function for of in if else while switch case break continue return
    hi! jsSkyKeywords guifg=#89ddff

    " Function & method calls
    syn match jsFuncCall display "\<\h\w*\ze\s*("
    syn match jsMethodCall display "\.\zs\h\w*\ze\s*("
    hi! jsFuncCall guifg=#7aa2f7
    hi! jsMethodCall guifg=#7aa2f7
  ]],

  python = [[
    " Constants in Tokyo Night Red (#f7768e)
    syn match pythonCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! pythonCapsIdent guifg=#f7768e

    " Modifiers in purple italic
    syn keyword pythonModifier async await self cls
    hi! pythonModifier guifg=#bb9af7 gui=italic cterm=italic

    " Control flow in sky blue
    syn keyword pythonSkyKeywords def class for in if elif else while break continue return yield try except finally with as
    hi! pythonSkyKeywords guifg=#89ddff

    " Function calls
    syn match pythonFuncCall display "\<\h\w*\ze\s*("
    hi! pythonFuncCall guifg=#7aa2f7
  ]],

  gleam = [[
    " pub in purple italic, const in purple NOT italic
    syn keyword gleamPubModifier pub
    syn keyword gleamStorage const
    syn keyword gleamLetModifier let
    hi! gleamPubModifier guifg=#bb9af7 gui=italic cterm=italic
    hi! gleamStorage guifg=#bb9af7 gui=NONE
    hi! gleamLetModifier guifg=#bb9af7 gui=italic cterm=italic

    " Constants in Tokyo Night Red (#f7768e)
    syn match gleamCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
    hi! gleamCapsIdent guifg=#f7768e

    " Control flow in sky blue
    syn keyword gleamSkyKeywords fn case if else panic
    hi! gleamSkyKeywords guifg=#89ddff

    " Function calls
    syn match gleamFuncCall display "\<\h\w*\ze\s*("
    hi! gleamFuncCall guifg=#7aa2f7
  ]],
}

function M.apply_for_buffer(buf)
  if not vim.api.nvim_buf_is_valid(buf) then return end
  local ft = vim.bo[buf].filetype
  if not ft or ft == "" then return end

  local vim_cmd = syntax_definitions[ft]
  if vim_cmd then
    vim.api.nvim_buf_call(buf, function()
      vim.cmd(vim_cmd)
    end)
  end
end

function M.setup(p)
  local group = vim.api.nvim_create_augroup("BestThemesSyntax", { clear = true })

  -- Listen for buffer filetype setting, syntax initialization, or buffer entering
  vim.api.nvim_create_autocmd({ "FileType", "Syntax", "BufWinEnter" }, {
    group = group,
    pattern = "*",
    callback = function(args)
      M.apply_for_buffer(args.buf)
    end,
  })

  -- Immediately apply to all currently existing, loaded buffers
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      M.apply_for_buffer(buf)
    end
  end
end

return M
