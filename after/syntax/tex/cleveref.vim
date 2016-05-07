" Additional \ref-commands:
syn region texRefZone		matchgroup=texStatement start="\\[cC]\(page\)\?ref\*\?{"	end="}\|%stopzone\>"	contains=@texRefGroup,texGoodRefComma

syn region texRefZone		matchgroup=texStatement start="\\name[cC]refs\?\*\?{"	end="}\|%stopzone\>"	contains=@texRefGroup,texGoodRefComma

syn region texRefZone		matchgroup=texStatement start="\\lcnamecrefs\?\*\?{"	end="}\|%stopzone\>"	contains=@texRefGroup,texGoodRefComma

syn region texRefZone		matchgroup=texStatement start="\\labelc\(page\)\?ref\*\?{"	end="}\|%stopzone\>"	contains=@texRefGroup,texGoodRefComma

" Commands which are followed by two arguments
syn region texRefZone		matchgroup=texStatement start="\\[cC]\(page\)\?refrange\*\?{"	end="}\|%stopzone\>"	contains=@texRefGroup,texBadRefComma nextgroup=texAdditionalRef
syn region texAdditionalRef	 contained matchgroup=texStatement start='{' end='}\|%stopzone\>'		contains=@texRefGroup,texBadRefComma

" Match commas in references
syn match texBadRefComma  ',' contained 
hi link   texBadRefComma  texError
syn match texGoodRefComma ',' contained 
hi link   texGoodRefComma texSpecialChar

" Highlighting of names of additional references
hi link texAdditionalRef Identifier
