// 1.
Builder := Object clone
Builder depth := 0
Builder indent := method("  " repeated(depth))
Builder indent
Builder forward := method(
  writeln(indent, "<", call message name, ">")
  depth = depth + 1
  call message arguments foreach(
	arg, 
	content :=self doMessage(arg); 
	if(content type == "Sequence", writeln(indent, content)))
  depth = depth - 1
  writeln(indent, "</", call message name, ">"))

Builder  ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))

