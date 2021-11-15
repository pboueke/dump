// 3.

OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
Map atPutNumber := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)

Builder := Object clone
Builder depth := 0
Builder indent := method("  " repeated(depth))
Builder forward := method(
  write(indent, "<", call message name)
  argument := call message arguments first
  if (argument != nil,
    attrs := doMessage(argument)
    if (attrs isKindOf(Map), attrs foreach(k, v, write(" ", k, "='", v, "'")))
  )
  writeln(">")
  depth = depth + 1
  call message arguments foreach(
	arg, 
	content :=self doMessage(arg); 
	if(content type == "Sequence", writeln(indent, content)))
  depth = depth - 1
  writeln(indent, "</", call message name, ">"))

// Not sure why OperatorTable is not updated if not reading from a file/string
str := "Builder  ul( {\"attr\":\"value\"}, li(\"Io\"), li(\"Lua\"),	li(\"JavaScript\"))"
doString(str)

