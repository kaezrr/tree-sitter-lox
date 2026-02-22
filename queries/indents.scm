; --- Block Indentation (Functions, Methods, etc.) ---
(block "{" @indent.begin "}" @indent.end)

; --- Class Indentation ---
; Your grammar defines braces directly in the class rule
(class_declaration "{" @indent.begin "}" @indent.end)

; --- Array/List Indentation ---
(primary "[" @indent.begin "]" @indent.end)

; --- Dangling Statements (if/while/for) ---
; If the consequence/body is NOT a block, indent it.
; @indent.dedent_next tells the editor to pull back after one line.
[
  (if_statement consequence: (_) @indent.begin)
  (if_statement alternative: (_) @indent.begin)
  (while_statement body: (_) @indent.begin)
  (for_statement body: (_) @indent.begin)
] @indent.dedent_next
  (#not-kind-eq? @indent.begin "block")
