; Identifiers

[
    (field)
    (field_identifier)
] @property

; Only the name is captured here; the `$` sigil is painted separately below.
(variable
  name: (identifier) @variable)

; Function calls

(function_call
  function: (identifier) @function)

(method_call
  method: (selector_expression
    field: (field_identifier) @function))

; Operators

"|" @operator
":=" @operator
"=" @operator

; Builtin functions

((identifier) @function.builtin
 (#match? @function.builtin "^(and|call|html|index|slice|js|len|not|or|print|printf|println|urlquery|eq|ne|lt|ge|gt|ge|indent|nindent|toYaml|toJson|trim|b64enc|b64dec|default)$"))

; Delimiters

"." @punctuation.delimiter
"," @punctuation.delimiter

; The `$` sigil is painted with the variable name rather than with the other
; delimiters, so `$name` reads as one token.
"$" @punctuation.special

"{{" @punctuation.bracket
"}}" @punctuation.bracket
"{{-" @punctuation.bracket
"-}}" @punctuation.bracket
; Parentheses are grouping inside an action, not template delimiters, so they
; get the same accent colour as the `$` sigil.
")" @punctuation.special
"(" @punctuation.special

; Keywords

"else" @keyword
"if" @keyword
"range" @keyword
"with" @keyword
"end" @keyword
"template" @keyword
"define" @keyword
"block" @keyword

; Literals

[
  (interpreted_string_literal)
  (raw_string_literal)
  (rune_literal)
] @string

(escape_sequence) @string.special

[
  (int_literal)
  (float_literal)
  (imaginary_literal)
] @number

[
  (true)
  (false)
  (nil)
] @constant.builtin

(comment) @comment
(ERROR) @error
