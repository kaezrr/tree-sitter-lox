; --- Literals & Keywords ---
(number) @number
(string) @string
(comment) @comment
["true" "false"] @boolean
"nil" @constant.builtin

[
  "var" "fun" "class" "return" "print" 
  "if" "else" "while" "for" "break"
] @keyword

["and" "or"] @keyword.operator
["this" "super"] @variable.builtin

; --- Functions & Methods ---

; 1. Built-in functions (Highest priority)
((call callee: (primary (identifier) @function.builtin))
 (#match? @function.builtin "^(clock|input|number|push|pop|len)$"))

; 2. Declarations
(fun_declaration name: (identifier) @function)
(member name: (identifier) @function.method)

; 3. Calls
(call callee: (primary (identifier) @function.call))
(call property: (identifier) @function.method)

; --- Types ---
(class_declaration name: (identifier) @type)
(class_declaration superclass: (identifier) @type)

; --- Parameters & Variables ---
(parameters (identifier) @variable.parameter)
(var_declaration name: (identifier) @variable)
(identifier) @variable  ; <--- FALLBACK (Keep at bottom)

"+" @operator  "-" @operator  "*" @operator  "/" @operator
"%" @operator  "=" @operator  "==" @operator  "!=" @operator
"<" @operator  "<=" @operator  ">" @operator  ">=" @operator
"!" @operator  "?" @operator  ":" @operator

"(" @punctuation.bracket  ")" @punctuation.bracket
"{" @punctuation.bracket  "}" @punctuation.bracket
"[" @punctuation.bracket  "]" @punctuation.bracket
"," @punctuation.delimiter  ";" @punctuation.delimiter
"." @punctuation.delimiter
