; Function and method bodies
(block "{" @indent.begin)
(block "}" @indent.branch)

; Class body - target the member directly
(class_declaration
  member: (member) @indent.begin)

; Member (method) bodies  
(member "{" @indent.begin)
(member "}" @indent.branch)

; Braceless bodies
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
