syn cluster texFoldGroup add=texNoSpellCommand
syn cluster texMatchGroup add=texNoSpellCommand

" Define NoSpell Commands
" With one mandatory argument
syn match texNoSpellCommand "\\\(email\|address\|urladdr\){.\{-}}"	contains=texStatement,texInputCurlies

" Fix highlight of ref/cite
" CHECK: What is actully fixed here?
syn clear texRefOption
syn clear texCite
syn clear texRefZone

syn region texRefZone		matchgroup=texStatement start="\\nocite{"		end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\bibliography{"		end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\\%(my\)\?label{"		end="}\|%stopzone\>"	contains=@texRefGroup
syn region texRefZone		matchgroup=texStatement start="\\\%(page\|eq\|v\|\)ref{"	end="}\|%stopzone\>"	contains=@texRefGroup

syn match  texStatement		'\\\%(paren\)\?cite\%([tp]\*\=\)\=\ze\%({\|\[\)' nextgroup=texRefOption,texCite
syn region texRefOption	contained	matchgroup=Delimiter start='\[' end=']'		contains=@texMatchGroup	nextgroup=texRefOption,texCite
syn region texCite	contained	matchgroup=texStatement start='{' end='}'		contains=@texRefGroup

" Better highlighting of names of references
hi link texRefZone Identifier


" Add spell for \begin{lemma}[some text]
" If the texBeginEndName contains some theorem-like string:
syn match texBeginEndName	"{\(lemma\|definition\|theorem\|remark\|assumption\|corollary\|proposition\)}" contained	nextgroup=texTheoremModifier	contains=texTheoremNameString
" Correct coloring of the braced string:
syn region texTheoremNameString matchgroup=Delimiter start="{" end="}" contained
" Add spell checking in the optional parameter:
syn region texTheoremModifier	contained	matchgroup=Delimiter start="\[" end="]" contained	contains=texComment,@texMatchGroup
" ,@texCmdGroup,@Spell

highlight link texTheoremModifier Normal
highlight link texTheoremNameString texSection


" Let \lstinline[language=C++]// let work similarly to \verb//
if exists("g:tex_verbspell") && g:tex_verbspell
 if version < 600
  syn region texZone		start="\\lstinline\(\[[^][]*\]\)\?`"			end="`\|%stopzone\>"			contains=@Spell
  syn region texZone		start="\\lstinline\(\[[^][]*\]\)\?#"			end="#\|%stopzone\>"			contains=@Spell
 else
   if b:tex_stylish
    syn region texZone		start="\\lstinline\(\[[^][]*\]\)\?\z([^\ta-zA-Z@]\)"	end="\z1\|%stopzone\>"			contains=@Spell
   else
    syn region texZone		start="\\lstinline\(\[[^][]*\]\)\?\z([^\ta-zA-Z]\)"	end="\z1\|%stopzone\>"			contains=@Spell
   endif
 endif
else
 if version < 600
  syn region texZone		start="\\lstinline\(\[[^][]*\]\)\?`"			end="`\|%stopzone\>"
  syn region texZone		start="\\lstinline\(\[[^][]*\]\)\?#"			end="#\|%stopzone\>"
 else
   if b:tex_stylish
     syn region texZone		start="\\lstinline\(\[[^][]*\]\)\?\z([^\ta-zA-Z@]\)"	end="\z1\|%stopzone\>"
   else
     syn region texZone		start="\\lstinline\(\[[^][]*\]\)\=\z([^\ta-zA-Z]\)"	end="\z1\|%stopzone\>"
   endif
 endif
endif
