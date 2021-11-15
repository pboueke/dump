// 1 fibonacci: 1 1 2 3 5 8 13...

// recursive
Number fibRec := method(
    num := call target
    if (num <=2, return 1)
    return ((num - 1) fibRec) + ((num - 2) fibRec)
)
10 fibRec println

// iterative
Number fibIt := method(
    num := call target
    fib := 1
    previousNewer := 0
    previousOlder := 0
    for (c, 1 , num-1,
        previousOlder = previousNewer
        previousNewer = fib
        fib = previousNewer + previousOlder
    )
    return fib
)
10 fibIt println