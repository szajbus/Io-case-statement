CaseStmt := Object clone
CaseStmt obj := nil
CaseStmt matchers := list()
CaseStmt elseVal := nil
CaseStmt when := method(val, msg,
  matchers append(list(val, msg))
  self
)
CaseStmt else := method(val,
  self elseVal := val
  self
)
CaseStmt do := method(
  matcher := matchers detect(matcher, matcher at(0) == obj)
  if(matcher, matcher at(1), elseVal)
)

case := method(obj,
  stmt := CaseStmt clone
  stmt obj := obj
  stmt
)

c := case(777) when(2, "two") when(1, "one") else("unknown")
c println
c do print
