" Best Themes — Syntax enhancements for C++ legacy syntax engine
syn match cppCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
syn keyword cppStorage const static constexpr
syn keyword cppModifier public private protected virtual explicit inline volatile
syn keyword cppSkyKeywords for while if else do switch case break continue return
syn match cFuncCall display "\<\h\w*\ze\s*("
syn match cMethodCall display "\(\.\|->\)\zs\h\w*\ze\s*("

hi def link cppCapsIdent Constant
hi def link cppStorage cppStorage
hi def link cppModifier cppModifier
hi def link cppSkyKeywords Statement
hi def link cFuncCall Function
hi def link cMethodCall Function
hi! cInclude guifg=#89ddff
hi! cDefine guifg=#bb9af7
hi! cPreProc guifg=#89ddff
