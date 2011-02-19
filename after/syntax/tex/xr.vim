syn match texExternalDocument		"\\\(externaldocument\)\s*\(\[.*\]\)\={.\{-}}"		contains=texStatement,texInputCurlies,texExternalDocumentOpt
syn region texExternalDocumentOpt	matchgroup=Delimiter start="\[" end="\]"			contained

hi link texExternalDocument	Special
hi link texExternalDocumentOpt	texRefZone
