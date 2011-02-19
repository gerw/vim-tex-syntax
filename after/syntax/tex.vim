syn cluster texFoldGroup add=texNoSpellCommand
syn cluster texMatchGroup add=texNoSpellCommand

" Define NoSpell Commands
" With one mandatory argument
syn match texNoSpellCommand "\\\(email\|address\|urladdr\){.\{-}}"	contains=texStatement,texInputCurlies

" Fix highlight of ref/cite
syn clear texRefOption
syn clear texCite
syn clear texRefZone

syn region texRefZone		matchgroup=texStatement start="\\nocite{"		end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\bibliography{"		end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\label{"		end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\\%(page\|eq\|v\|\)ref{"	end="}\|%stopzone\>"	contains=@texRefGroup

syn match  texStatement		'\\cite\%([tp]\*\=\)\=\ze\%({\|\[\)' nextgroup=texRefOption,texCite
syn region texRefOption	contained	matchgroup=Delimiter start='\[' end=']'		contains=@texMatchGroup	nextgroup=texRefOption,texCite
syn region texCite	contained	matchgroup=texStatement start='{' end='}'		contains=@texRefGroup

" Due to the concealment in vim 7.3 some things has ugly highlight:
syn cluster texMathZoneGroup	remove=texGreek,texSuperscript,texSubscript,texMathSymbol
syn cluster texMathMatchGroup	remove=texGreek,texSuperscript,texSubscript,texMathSymbol

" Better highlighting of names of references
hi link texRefZone Identifier


" Add spell for \begin{lemma}[some text]
" If the SectionName contains some theorem-like string:
syn match texSectionName	"{\(lemma\|definition\|theorem\|remark\|assumption\|corollary\|proposition\)}" contained	nextgroup=texTheoremModifier	contains=texTheoremNameString
" Correct coloring of the braced string:
syn region texTheoremNameString matchgroup=Delimiter start="{" end="}" contained
" Add spell checking in the optional parameter:
syn region texTheoremModifier	contained	matchgroup=Delimiter start="\[" end="]" contained	contains=texComment,@texMatchGroup
" ,@texCmdGroup,@Spell

highlight link texTheoremModifier Normal
highlight link texTheoremNameString texSection
