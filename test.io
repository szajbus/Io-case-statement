doFile("case.io")

CaseStmtTest := UnitTest clone do(
  testOneLiner := method(
    result := case(2) when(1) then("one") when(2) then("two") do
    assertEquals("two", result)
  )

  testElse := method(
    result := case(3) when(1) then("one") when(2) then("two") else("other") do
    assertEquals("other", result)
  )

  testMultipleValue := method(
    result := case(2) when(1) then("one") when(2, 3, 4) then("two, three or four") do
    assertEquals("two, three or four", result)
  )

  testMultilineDefinition := method(
    result := case(2) do(
      when(1) then("one")
      when(2) then("two")
      else("other")
    )
    assertEquals("two", result)
  )
)

CaseStmtTest run
