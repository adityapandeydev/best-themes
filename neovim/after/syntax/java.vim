" Best Themes — Syntax enhancements for Java legacy syntax engine
syn keyword javaModifier public private protected static final synchronized volatile abstract
syn keyword javaSkyKeywords for while if else do switch case break continue return
syn match javaCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
syn match javaMethodCall display "\.\zs\h\w*\ze\s*("

hi def link javaModifier StorageClass
hi def link javaSkyKeywords Statement
hi def link javaConditional Statement
hi def link javaRepeat Statement
hi def link javaBranch Statement
hi def link javaStatement Statement
hi def link javaCapsIdent Constant
hi def link javaMethodCall Function
