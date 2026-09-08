" Best Themes — Syntax enhancements for Zig legacy syntax engine
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
