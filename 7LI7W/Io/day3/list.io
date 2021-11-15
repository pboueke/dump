// 2.
squareBrackets := method(
    l := List clone
    call message arguments foreach(arg,
        l append(arg)
    )
    l
)

List squareBrackets := method(index, value, if(value == nil, at(index), atPut(index, value)))

l := [1,2,3]
l println
l[1] println
l[1,10]
l println