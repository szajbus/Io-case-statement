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

    case(2) do(
      when(1) then("one")
      when(2) then("two")
      else("other")
    )
    # ==> two
*/

CaseStmt := Object clone do(
  init := method(
    self val := nil
    self whens := list()
    self elseMsg := nil
  )

  when := method(
    when := When clone
    when case = self
    when msgs = call message arguments
    whens append(when)
    when
  )

  else := method(
    self elseMsg = call message argAt(0)
    self
  )

  do = method(
    resend
    match := whens detect(when, when match(val))
    if(match, doMessage(match thenMsg argAt(0)), doMessage(elseMsg))
  )

  When := Object clone do(
    init := method(
      self case := nil
      self msgs := list()
      self thenMsg := nil
    )

    then := method(
      self thenMsg = call message
      case
    )

    match := method(val,
      msgs foreach(msg, if(doMessage(msg) == val, return true))
      false
    )
  )
)

Object case := method(val,
  case := CaseStmt clone
  case val = val
  case
)
