" Additional \ref-commands:
syn region texRefZone		matchgroup=texStatement start="\\\a*ref\*\={"	end="}\|%stopzone\>"	contains=@texRefGroup

" For the \hyperref[some_label]{some_text}
syn match  texStatement		'\\hyperref\ze\[' nextgroup=texHyperrefOption,texHyperref
syn region texHyperrefOption	contained	matchgroup=Delimiter start='\[' end=']'		contains=@texRefGroup	nextgroup=texHyperref
syn region texHyperref	contained	matchgroup=texStatement start='{' end='}'		contains=@texMatchGroup
highlight link texHyperrefOption texRefZone
highlight link texHyperref Normal

" syn region texRefZone		matchgroup=Delimiter start="\\hyperref\["	end="]\|%stopzone\>"	contains=@texRefGroup
