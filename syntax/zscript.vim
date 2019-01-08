" Vim syntax file
" Language: ZScript
" Maintainer: Marrub

if exists('b:current_syntax') | fini | en

let b:current_syntax="zscript"

sy case ignore

sy sync minlines=200
sy sync maxlines=500

" Class Definitions ----------------------------------------------------------|

sy keyword zscType int8 uint8 int16 uint16 int uint float double float32 float64 string vector2 vector3 bool textureid spriteid statelabel void array map voidptr color sound sbyte byte short ushort name
sy   match zscType /@/

sy keyword zscStorage class struct enum const property extend flagdef let

sy keyword zscFlag abstract ui play replaces native version clearscope private protected meta transient readonly deprecated static virtualscope virtual override final action vararg internal latent

sy keyword zscStatement in out sizeof alignof is new self invoker
sy   match zscStatement "#include"

sy keyword zscConstant false true null

sy keyword zscTodo contained TODO FIXME HACK XXX NB NOTE

sy region zscComment start="/\*" end="\*/" contains=zscTodo,@Spell
sy  match zscComment "//.*$" contains=zscTodo,@Spell

sy keyword zscLabel case

sy keyword zscConditional else if switch

sy keyword zscRepeat break continue do for goto return while until

sy match zscNumber "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
sy match zscNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fF]\="
sy match zscNumber "\<\d\+[eE][-+]\=\d\+[fF]\=\>"
sy match zscNumber "\<\d\+\([eE][-+]\=\d\+\)\=[fF]\>"

sy match zscSpecialChar contained +\\["\\'0abcfnrtvx]+

sy region zscString start=+"+ end=+"+ end=+$+ contains=zscSpecialChar,@Spell

sy region zscName start=+'+ end=+'+ end=+$+

sy keyword zscOperator cross dot

sy cluster ZscCode contains=zscOperator,zscName,zscString,zscNumber,zscRepeat,zscConditional,zscLabel,zscComment,zscConstant,zscStatement,zscFlag,zscStorage,zscType

" State Definitions ----------------------------------------------------------|

sy match zscStateNum /\<-\=\d\+\>/ contained

sy match zscStateLabel /\h\w*:/ contained

sy keyword zscStateType goto loop wait stop fail contained

sy keyword zscStateParam bright canraise fast light nodelay offset slow contained
sy   match zscStateSta /\S\{4,6}\s\+\S\+\s\+\(\d\+\|random(\s*\d\+\s*,\s*\d\+\s*)\)\(\s\+bright\|\s\+canraise\|\s\+fast\|\s\+nodelay\|\s\+slow\|\s\+light\s*(\s*"[^"]*"\s*)\|\s\+offset\s*(\s*\(\d\|-\|+\)\+\s*,\s*\(\d\|-\|+\)\+\s*)\)*/ skipwhite skipempty contained contains=zscStateParam,zscStateNum nextgroup=zscStateBlk,zscStateFcn
sy   match zscStateFcn /\w\+/ contained contains=@ZscCode nextgroup=zscStatePrn
sy  region zscStatePrn transparent fold start=+(+ end=+)+ contained contains=@ZscCode,zscStatePrn
sy  region zscStateBlk transparent fold start=+{+ end=+}+ contained contains=@ZscCode,zscStateBlk

sy cluster ZscStates contains=zscStateSta,zscStateType,zscStateLabel,zscComment

" Actor Default Definitions --------------------------------------------------|

sy match zscDeftDefn /\(\w\+\.\=\)\+/ skipwhite skipempty contained nextgroup=zscDeftSet
sy match zscDeftSet /.*;/ contained contains=@ZscCode

sy match zscDeftFlag /\(-\|+\)\(\w\+\.\=\)\+/ contained

sy cluster ZscDefaults contains=zscDeftDefn,zscDeftFlag

" Blocks ---------------------------------------------------------------------|

sy keyword zscStatesSta states skipwhite skipempty nextgroup=zscStatesMid,zscStatesEnd
sy   match zscStatesMid /(\(actor\|overlay\|weapon\|item\))/ skipwhite skipempty nextgroup=zscStatesEnd
sy  region zscStatesEnd start=+{+ end=+}+ skipwhite skipempty contained contains=@ZscStates

sy keyword zscDefaultSta default skipwhite skipempty nextgroup=zscDefaultEnd
sy  region zscDefaultEnd start=+{+ end=+}+ skipwhite skipempty contained contains=@ZscDefaults

" Highlighting ---------------------------------------------------------------|

hi def link zscStatesSta  StorageClass
hi def link zscDefaultSta StorageClass

hi def link zscDeftDefn Special
hi def link zscDeftFlag Tag

hi def link zscStateNum   Number
hi def link zscStateLabel Label
hi def link zscStateParam StorageClass
hi def link zscStateType  Conditional

hi def link zscType        Type
hi def link zscStorage     StorageClass
hi def link zscFlag        StorageClass
hi def link zscLabel       Label
hi def link zscConstant    Constant
hi def link zscComment     Comment
hi def link zscConditional Conditional
hi def link zscRepeat      Repeat
hi def link zscNumber      Number
hi def link zscString      String
hi def link zscName        String
hi def link zscOperator    Operator
hi def link zscStatement   Statement

" EOF
