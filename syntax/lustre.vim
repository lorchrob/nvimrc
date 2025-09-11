" Syntax highlighting for Lustre

" Keywords
syntax keyword lustreKeyword node function returns var let tel type const 
syntax keyword lustreKeyword if then else case esac
syntax keyword lustreKeyword true false

" Operators (word-based and symbol-based)
syntax keyword lustreOperator and or not mod div
syntax match lustreOperator ">=\|<=\|==\|!=\|->\|=>\|=\|+\|-\|\*\|/\|>\|<\|\^"

" Types
syntax keyword lustreType int bool real subtype subrange enum map

" Numbers
syntax match   lustreNumber "\<\d\+\>"

" Comments
syntax match lustreComment "--.*$" contains=NONE

" Highlighting rules
highlight link lustreKeyword Keyword
highlight link lustreOperator Special
highlight link lustreType Type
highlight link lustreNumber Number
highlight link lustreComment Comment

" highlight Operator ctermfg=Red guifg=Red

