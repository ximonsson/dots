hi clear

let g:colors_name = "x33m0n"

hi Normal       ctermfg=250

hi Comment      ctermfg=241
hi Special      ctermfg=255 cterm=none
hi link SpecialChar Special
hi link SpecialComment Comment
hi LineNr       ctermfg=239
hi CursorLine   cterm=none ctermbg=0
hi CursorLineNr cterm=none ctermfg=7
hi Search       ctermfg=none  ctermbg=none cterm=reverse
hi Visual       ctermbg=0 ctermfg=8

hi StatusLine   cterm=none ctermbg=0 ctermfg=15
hi clear StatusLineNC
hi StatusLineNC ctermbg=0 ctermfg=15
hi clear VertSplit
hi VertSplit    ctermfg=0 ctermbg=0

hi Todo         ctermfg=11 ctermbg=0
hi MoreMsg      ctermfg=4
hi WarningMsg   ctermfg=1
hi Question     ctermfg=4
hi Directory    ctermfg=4
hi Identifier   ctermfg=14 cterm=none
hi Function     ctermfg=255 cterm=none

hi Type         ctermfg=14 cterm=none
hi Conditional  ctermfg=14 cterm=bold
hi Constant     ctermfg=9
hi String       ctermfg=255
hi Statement    ctermfg=14 cterm=none
hi Keyword      ctermfg=255 cterm=bold
hi Integer      ctermfg=1
hi PreProc      ctermfg=15 cterm=bold

hi TabLine      ctermbg=none cterm=none ctermfg=8
hi clear TabLineFill
hi link TabLineFill TabLine
" hi TabLineFill ctermbg=0
hi TabLineSel   ctermfg=16 ctermbg=15

hi Pmenu ctermbg=0 ctermfg=240
hi PmenuSel ctermbg=240 ctermfg=14

hi Title ctermfg=255
