" Best Themes — Syntax enhancements for Rust legacy syntax engine
syn keyword rustPubModifier pub
syn keyword rustMutModifier mut
syn keyword rustLetModifier let
syn match rustCapsIdent display "\<[A-Z][A-Z0-9_]\+\>"
syn keyword rustFnKeyword fn
syn keyword rustSkyKeywords impl for in if else while loop break continue return
syn region rustEnumBlock start="enum\s\+[A-Z][a-zA-Z0-9_]*\s*{" end="}" contains=rustEnumVariantIdent,rustComment,rustString,rustAttribute,rustCapsIdent,rustStorage
syn match rustEnumVariantIdent contained display "\<[A-Z][a-zA-Z0-9_]*\ze\s*\(=\|,\|\n\)"
syn region rustAttribute start="#!\?\[" end="\]" contains=rustAttributeTrait,rustString,rustComment
syn match rustAttributeTrait contained display "\<[A-Z][a-zA-Z0-9_]*\>"
syn match rustFuncCall display "\<\h\w*\ze\s*("
syn match rustMethodCall display "\.\zs\h\w*\ze\s*("

hi def link rustPubModifier @keyword.modifier
hi def link rustMutModifier @keyword.modifier
hi def link rustLetModifier @keyword.modifier
hi def link rustCapsIdent Constant
hi def link rustFnKeyword @keyword.function
hi def link rustSkyKeywords Statement
hi def link rustEnumVariantIdent @type.enum.variant
hi def link rustAttribute @attribute
hi def link rustAttributeTrait @type
hi def link rustFuncCall Function
hi def link rustMethodCall Function
hi def link rustStorage StorageClass
hi def link rustStructure Structure
