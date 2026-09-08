local M = {}

local function get_syntax_cmds(p)
  return {
    rust = [[
      syn keyword rustPubModifier pub
      syn keyword rustMutModifier mut
      syn keyword rustLetModifier let
      syn match rustCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword rustSkyKeywords fn impl for in if else while loop break continue return
      syn match rustEnumVariantIdent display "\<[A-Z][a-zA-Z0-9_]*\ze\s*\(=\|,\|\n\)"
      syn match rustFuncCall display "\<\h\w*\ze\s*("
      syn match rustMethodCall display "\.\zs\h\w*\ze\s*("

      hi def link rustPubModifier @keyword.modifier
      hi def link rustMutModifier @keyword.modifier
      hi def link rustLetModifier @keyword.modifier
      hi def link rustCapsIdent Constant
      hi def link rustSkyKeywords Statement
      hi def link rustEnumVariantIdent @type.enum.variant
      hi def link rustFuncCall Function
      hi def link rustMethodCall Function
      hi def link rustType Type
      hi def link rustDeriveTrait Type
      hi def link rustTrait Type
      hi def link rustEnum Type
      hi def link rustStorage StorageClass
      hi def link rustStructure Structure
      hi def link rustAttribute @attribute
    ]],

    zig = [[
      syn keyword zigPubModifier pub
      syn keyword zigStorage const var
      syn match zigCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword zigSkyKeywords fn for while if else break continue return
      syn match zigBuiltin display "@\h\w*"
      syn match zigFuncCall display "\<\h\w*\ze\s*("
      syn match zigMethodCall display "\.\zs\h\w*\ze\s*("

      hi def link zigPubModifier @keyword.modifier
      hi def link zigStorage StorageClass
      hi def link zigCapsIdent Constant
      hi def link zigSkyKeywords Statement
      hi def link zigBuiltin PreProc
      hi def link zigFuncCall Function
      hi def link zigMethodCall Function
    ]],

    c = [[
      syn match cppCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword cppStorage const static constexpr
      syn keyword cppModifier inline volatile
      syn keyword cppSkyKeywords for while if else do switch case break continue return
      syn match cFuncCall display "\<\h\w*\ze\s*("
      syn match cMethodCall display "\(\.\|->\)\zs\h\w*\ze\s*("

      hi def link cppCapsIdent Constant
      hi def link cppStorage StorageClass
      hi def link cppModifier StorageClass
      hi def link cppSkyKeywords Statement
      hi def link cFuncCall Function
      hi def link cMethodCall Function
      hi def link cInclude Include
      hi def link cDefine Define
      hi def link cPreProc PreProc
    ]],

    cpp = [[
      syn match cppCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword cppStorage const static constexpr
      syn keyword cppModifier public private protected virtual explicit inline volatile
      syn keyword cppSkyKeywords for while if else do switch case break continue return
      syn match cFuncCall display "\<\h\w*\ze\s*("
      syn match cMethodCall display "\(\.\|->\)\zs\h\w*\ze\s*("

      hi def link cppCapsIdent Constant
      hi def link cppStorage StorageClass
      hi def link cppModifier StorageClass
      hi def link cppSkyKeywords Statement
      hi def link cFuncCall Function
      hi def link cMethodCall Function
      hi def link cInclude Include
      hi def link cDefine Define
      hi def link cPreProc PreProc
    ]],

    java = [[
      syn match javaCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn match javaVarIdent display "\<[a-z][a-zA-Z0-9_]*\>"
      syn keyword javaModifier public private protected static final synchronized volatile abstract
      syn keyword javaSkyKeywords for while if else do switch case break continue return
      syn match javaMethodCall display "\.\zs\h\w*\ze\s*("

      hi def link javaModifier StorageClass
      hi def link javaScopeDecl StorageClass
      hi def link javaStorageClass StorageClass
      hi def link javaSkyKeywords Statement
      hi def link javaConditional Statement
      hi def link javaRepeat Statement
      hi def link javaBranch Statement
      hi def link javaStatement Statement
      hi def link javaCapsIdent Constant
      hi def link javaMethodCall Function
    ]],

    go = [[
      syn keyword goStorage const var
      syn match goCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword goSkyKeywords func for range if else switch case select return break continue
      syn match goFuncCall display "\<\h\w*\ze\s*("
      syn match goMethodCall display "\.\zs\h\w*\ze\s*("

      hi def link goStorage StorageClass
      hi def link goCapsIdent Constant
      hi def link goSkyKeywords Statement
      hi def link goFuncCall Function
      hi def link goMethodCall Function
    ]],

    typescript = [[
      syn keyword tsStorage const
      syn keyword tsModifier let export import async static public private protected readonly
      syn match tsCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword tsSkyKeywords function return if else for while switch case break continue
      syn match tsFuncCall display "\<\h\w*\ze\s*("
      syn match tsMethodCall display "\.\zs\h\w*\ze\s*("

      hi def link tsStorage StorageClass
      hi def link tsModifier @keyword.modifier
      hi def link tsCapsIdent Constant
      hi def link tsSkyKeywords Statement
      hi def link tsFuncCall Function
      hi def link tsMethodCall Function
    ]],

    javascript = [[
      syn keyword jsStorage const
      syn keyword jsModifier let export import async static readonly
      syn match jsCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword jsSkyKeywords function return if else for while switch case break continue
      syn match jsFuncCall display "\<\h\w*\ze\s*("
      syn match jsMethodCall display "\.\zs\h\w*\ze\s*("

      hi def link jsStorage StorageClass
      hi def link jsModifier @keyword.modifier
      hi def link jsCapsIdent Constant
      hi def link jsSkyKeywords Statement
      hi def link jsFuncCall Function
      hi def link jsMethodCall Function
    ]],

    python = [[
      syn match pythonCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword pythonSkyKeywords def class return if elif else for while break continue try except
      syn match pythonFuncCall display "\<\h\w*\ze\s*("
      syn match pythonMethodCall display "\.\zs\h\w*\ze\s*("

      hi def link pythonCapsIdent Constant
      hi def link pythonSkyKeywords Statement
      hi def link pythonFuncCall Function
      hi def link pythonMethodCall Function
    ]],

    gleam = [[
      syn keyword gleamPubModifier pub
      syn keyword gleamStorage const let
      syn match gleamCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
      syn keyword gleamSkyKeywords fn case if else panic
      syn match gleamFuncCall display "\<\h\w*\ze\s*("

      hi def link gleamPubModifier @keyword.modifier
      hi def link gleamStorage StorageClass
      hi def link gleamCapsIdent Constant
      hi def link gleamSkyKeywords Statement
      hi def link gleamFuncCall Function
    ]],
  }
end

local active_syntax = {}

function M.apply_for_buffer(buf)
  if not vim.api.nvim_buf_is_valid(buf) then return end
  local ft = vim.bo[buf].filetype
  if not ft or ft == "" then return end

  local vim_cmd = active_syntax[ft]
  if vim_cmd then
    vim.api.nvim_buf_call(buf, function()
      vim.cmd(vim_cmd)
    end)
  end
end

function M.setup(p)
  active_syntax = get_syntax_cmds(p)
  local group = vim.api.nvim_create_augroup("BestThemesSyntax", { clear = true })

  vim.api.nvim_create_autocmd({ "FileType", "Syntax", "BufWinEnter" }, {
    group = group,
    pattern = "*",
    callback = function(args)
      M.apply_for_buffer(args.buf)
    end,
  })

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      M.apply_for_buffer(buf)
    end
  end
end

return M
