(block
  open: (_) @indent.begin
  close: (_) @indent.branch)

(class_declaration
  open: (_) @indent.begin
  close: (_) @indent.branch)

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
