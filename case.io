/*
  Case Statement

  Generic usage:

    case(val) when(val1) then(msg1) when(val2) then(msg2) ... else(msgElse) do

  Basic example:

    case(2) when(1) then("one") when(2) then("two") do
    # ==> two

  Else clause:

    case(3) when(1) then("one") when(2) then("two") else("other") do
    # ==> other

  Multiple values in when clause (will match any):

    case(2) when(1) then("one") when(2, 3, 4) then("two, three or four") do
    # ==> two, three or four

  Multiline definition:

    case(2) {
      when(1) then("one")
      when(2) then("two")
      else("other")
    } do
    # ==> two
*/

CaseStmt := Object clone

CaseStmt val := nil
CaseStmt whens := list()
CaseStmt elseMsg := nil

CaseStmt when := method(
  when := When clone
  when case = self
  when msgs = call message arguments
  whens append(when)
  when
)

CaseStmt else := method(
  self elseMsg = call message argAt(0)
  self
)

CaseStmt do := method(
  match := whens detect(when, when match(val))
  if(match, doMessage(match thenMsg argAt(0)), doMessage(elseMsg))
)

CaseStmt When := Object clone

CaseStmt When case := nil
CaseStmt When msgs := list()
CaseStmt When thenMsg := nil

CaseStmt When then := method(
  self thenMsg = call message
  case
)

CaseStmt When match := method(val,
  msgs foreach(msg, if(doMessage(msg) == val, return true))
  false
)

CaseStmt curlyBrackets := method(
  call message arguments foreach(msg, doMessage(msg))
)

case := method(val,
  case := CaseStmt clone
  case val = val
  case
)
