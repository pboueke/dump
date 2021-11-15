// 5.
List2D := clone List

dim := method(x,y, List2D clone setSize(y) mapInPlace(_, List clone setSize(x)))

List2D set := method(x,y,value, at(y) atPut(x,value))
List2D get := method(x,y, at(y) at(x))

a := dim(3,2)
a println
a set(2,1,1)
a println
a get(2,1) println

// 6.
List2D transpose := method(
    matrix := call target
    new_matrix := dim(matrix size, matrix at(0) size)
    for(y,0,matrix size -1, 
        for(x,0,matrix at(0) size -1, 
            new_matrix set(y,x, matrix get(x,y))
        ) 
    )
    return new_matrix
)

a set(0,0,0)
a set(1,0,1)
a set(2,0,2)
a set(0,1,3)
a set(1,1,4)
a set(2,1,5)

a println
a transpose println

// 7. 
List2D writeToFile := method(filename,
    matrix := call target
    file := File open(filename)
    matrix foreach(row, file write(row join(",")) write("\n"))
)

"Writing a to file" println
a writeToFile("matrix.csv")

List2D readFromFile := method(filename,
    file := File open(filename) rewind
    matrix := list()
    file foreachLine(line, matrix insertAt(line split(","), matrix size))
    return matrix
)

"Reading a from file" println
List2D readFromFile("matrix.csv") println