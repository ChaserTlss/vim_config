if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop to while time
syntax keyword potionKeyword class return
syntax keyword potionKeyword if elesif else
syntax keyword potionKeyword string print say join
highlight link potionKeyword Keyword


syntax keyword potionFunction join say
highlight link potionFunction Function

syntax match potionComment "\v#.*$"
highlight link potionComment Comment


syntax match potionOperator "\v\*"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\%"
highlight link potionOperator Operator


syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link potionString String

let b:current_syntax = "potion"
