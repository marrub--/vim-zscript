" Vim syntax file
" Language: ZScript
" Maintainer: Marrub

if exists("b:current_syntax")
   fini
en

let b:current_syntax = "zscript"

syn case ignore

syn keyword zscType int8 uint8 int16 uint16 int uint float double float32 float64 string vector2 vector3 bool textureid spriteid statelabel void array map voidptr let

syn keyword zscStorage class struct enum const property default states extend

syn keyword zscFlag abstract ui play replaces native version clearscope private protected meta transient readonly deprecated static virtualscope virtual override final action vararg internal

syn keyword zscStatement in out sizeof alignof is new self invoker
syn match zscStatement "#include"

syn keyword zscConstant false true null

syn keyword zscTodo contained TODO FIXME
syn region zscComment start="/\*" end="\*/" contains=zscTodo,@Spell
syn match zscComment "//.*$" contains=zscTodo,@Spell

syn keyword zscLabel case
syn match zscLabel display +^\s*\I\i*\s*:\([^:]\)\@=+

syn keyword zscConditional else if switch

syn keyword zscRepeat break continue do for goto return while until

syn match zscNumber "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match zscNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fF]\="
syn match zscNumber "\<\d\+[eE][-+]\=\d\+[fF]\=\>"
syn match zscNumber "\<\d\+\([eE][-+]\=\d\+\)\=[fF]\>"

syn match zscSpecialChar contained +\\["\\'0abcfnrtvx]+

syn region zscString start=+"+ end=+"+ end=+$+ contains=zscSpecialChar,@Spell
syn region zscName start=+'+ end=+'+ end=+$+

syn keyword zscOperator cross dot

hi def link zscType Type
hi def link zscStorage StorageClass
hi def link zscFlag StorageClass
hi def link zscLabel Label
hi def link zscConstant Constant
hi def link zscComment Comment
hi def link zscConditional Conditional
hi def link zscRepeat Repeat
hi def link zscNumber Number
hi def link zscString String
hi def link zscName String
hi def link zscOperator Operator
hi def link zscStatement Statement

" EOF
