" Best Themes — Syntax enhancements for C legacy syntax engine
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
