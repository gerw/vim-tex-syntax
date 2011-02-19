" \index-command:
syn region texRefZone		matchgroup=texStatement start="\\index\={"	end="}\|%stopzone\>"	contains=@texRefGroup, texIndexSymbol
syn match texIndexSymbol	"|\|!"	contained

hi texIndexSymbol guifg=#005f5f gui=bold
