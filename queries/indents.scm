; Block bodies (functions, methods, standalone blocks)
(block
  "{" @indent.begin
  "}" @indent.branch)

; Class body
(class_declaration
  "{" @indent.begin
  "}" @indent.branch)

; Member (methods inside class)
(member
  "{" @indent.begin
  "}" @indent.branch)

; Braceless control flow bodies
(if_statement
  consequence: (_) @indent.begin
  (#not-kind-eq? @indent.begin "block"))
(if_statement
  alternative: (_) @indent.begin
  (#not-kind-eq? @indent.begin "block"))
(while_statement
  body: (_) @indent.begin
  (#not-kind-eq? @indent.begin "block"))
(for_statement
  body: (_) @indent.begin
  (#not-kind-eq? @indent.begin "block"))
