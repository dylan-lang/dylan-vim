" Vim syntax file
" Language:	Dylan
" Authors:	Justus Pendleton <justus@acm.org>
"		Brent A. Fulgham <bfulgham@debian.org>
" Last Change:	Fri Sep 29 13:45:55 PDT 2000
"
" This syntax file is based on the Haskell, Perl, Scheme, and C
" syntax files.

" Part 1:  Syntax definition
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

if version < 600
  set lisp
  set iskeyword+=?
else
  setlocal lisp
  setlocal iskeyword+=?
endif

" Highlight special characters (those that have backslashes) differently
syn match	dylanSpecial		display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"

" Keywords
syn keyword	dylanBlock		afterwards begin block cleanup end
syn keyword	dylanClassMods		abstract concrete primary inherited virtual
syn keyword	dylanException		exception handler signal
syn keyword	dylanParamDefs		method class function library macro interface
syn keyword	dylanSimpleDefs		constant variable generic primary
syn keyword	dylanOther		above below from by in instance local slot subclass then to
syn keyword	dylanConditional	if when select case else elseif unless finally otherwise then
syn keyword	dylanRepeat		begin for until while from to
syn keyword	dylanStatement		define let
syn keyword	dylanImport		use import export exclude rename create
syn keyword	dylanMiscMods		open dynamic compiler-open sealed domain singleton sideways inline may-inline inline-only

" Unary operators
syn match	dylanOperator		"[\t \(\[]-\|\~"
" Binary operators
syn match	dylanOperator		"\s[+\|\-\|*\|/\|\^\|=\|&\||\|>\|<]\s"
syn match	dylanOperator		"\s==\s"
syn match	dylanOperator		"\s:=\s"
syn match	dylanOperator		"\s>=\s"
syn match	dylanOperator		"\s<=\s"
syn match	dylanOperator		"\s\~=\s"
syn match	dylanOperator		"\s\~==\s"
syn match	dylanOperator		"\s=>\s"
syn match	dylanOperator		"\s=>$"
syn match	dylanOperator		"\s::\s"
" Numbers
syn match	dylanNumber		"\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match	dylanNumber		"\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
" Booleans
syn match	dylanBoolean		"#t\|#f"
" Comments
syn match	dylanComment		"//.*" contains=@Spell
syn region	dylanCommentMulti		start="/\*" end="\*/" contains=DylanCommentMulti,@Spell
" Strings
syn region	dylanString		start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=dySpecial,@Spell
syn match	dylanCharacter		"'[^\\]'"
" Constants, classes, and variables
syn match	dylanConstant		"$\<[a-zA-Z0-9\-]\+\>"
syn match	dylanClass		"<\<[a-zA-Z0-9\-\*\/]\+\>>"
syn match	dylanVariable		"\*\<[a-zA-Z0-9\-]\+\>\*"
" Preconditions
syn region	dylanPrecondit		start="^\s*#\s*\(if\>\|else\>\|endif\>\)" skip="\\$" end="$"

" These appear at the top of files (usually).  I like to highlight the whole line
" so that the definition stands out.  They should probably really be keywords, but they
" don't generally appear in the middle of a line of code.
syn region	dylanHeader	start="^[Mm]odule:" end="^$" contains=@Spell

" Functions defined in the DRM
syn keyword dylanFunction abort abs add add! add-method add-new add-new!
syn keyword dylanFunction all-superclasses always any? applicable-method?
syn keyword dylanFunction apply aref aref-setter as as-lowercase as-lowercase!
syn keyword dylanFunction as-uppercase as-uppercase! ash backward-iteration-protocol
syn keyword dylanFunction break ceiling ceiling/ cerror check-type choose
syn keyword dylanFunction choose-by complement compose concatenate
syn keyword dylanFunction concatenate-as condition-format-arguments
syn keyword dylanFunction condition-format-string conjoin copy-sequence
syn keyword dylanFunction curry default-handler dimension dimensions
syn keyword dylanFunction direct-subclasses direct-superclasses disjoin
syn keyword dylanFunction do do-handlers element element-setter empty?
syn keyword dylanFunction error even? every? false-or fill! find-key
syn keyword dylanFunction find-method first first-setter floor floor/
syn keyword dylanFunction forward-iteration-protocol function-arguments
syn keyword dylanFunction function-return-values function-specializers
syn keyword dylanFunction gcd generic-function-mandatory-keywords
syn keyword dylanFunction generic-function-methods head head-setter
syn keyword dylanFunction identity initialize instance? integral?
syn keyword dylanFunction intersection key-sequence key-test last
syn keyword dylanFunction last-setter lcm limited list logand logbit?
syn keyword dylanFunction logior lognot logxor make map map-as map-into
syn keyword dylanFunction max member? merge-hash-codes min modulo negative
syn keyword dylanFunction negative? next-method object-class object-hash
syn keyword dylanFunction odd? one-of pair pop pop-last positive? push
syn keyword dylanFunction push-last range rank rcurry reduce reduce1
syn keyword dylanFunction remainder remove remove! remove-duplicates
syn keyword dylanFunction remove-duplicates! remove-key! remove-method
syn keyword dylanFunction replace-elements! replace-subsequence!
syn keyword dylanFunction restart-query return-allowed? return-description
syn keyword dylanFunction return-query reverse reverse! round round/
syn keyword dylanFunction row-major-index second second-setter shallow-copy
syn keyword dylanFunction signal singleton size size-setter slot-initialized?
syn keyword dylanFunction sort sort! sorted-applicable-methods subsequence-position
syn keyword dylanFunction subtype? table-protocol tail tail-setter third third-setter
syn keyword dylanFunction truncate truncate/ type-error-expected-type
syn keyword dylanFunction type-error-value type-for-copy type-union
syn keyword dylanFunction union values vector zero

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_dylan_syntax_inits")
  if version < 508
    let did_dylan_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink dylanBlock		PreProc
  HiLink dylanBoolean		Boolean
  HiLink dylanCharacter		Character
  HiLink dylanClass		Structure
  HiLink dylanClassMods		StorageClass
  HiLink dylanComment		Comment
  HiLink dylanCommentMulti		Comment
  HiLink dylanConditional	Conditional
  HiLink dylanConstant		Constant
  HiLink dylanException		Exception
  HiLink dylanFunction	Function
  HiLink dylanHeader		Macro
  HiLink dylanImport		Include
  HiLink dylanLabel		Label
  HiLink dylanMiscMods		StorageClass
  HiLink dylanNumber		Number
  HiLink dylanOther		Keyword
  HiLink dylanOperator		Operator
  HiLink dylanParamDefs		Keyword
  HiLink dylanPrecondit		PreCondit
  HiLink dylanRepeat		Repeat
  HiLink dylanSimpleDefs	Keyword
  HiLink dylanStatement		Macro
  HiLink dylanString		String
  HiLink dylanVariable		Identifier

  delcommand HiLink
endif

let b:current_syntax = "dylan"

" vim:ts=8
