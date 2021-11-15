// 1. at fibonacci.io

// 2. 
(1/0) println // Inf

normalDiv := Number getSlot("/")
Number / = method(div,
    num := call target
    if (div == 0, return 0)
    return (num normalDiv(div))
)

(1/0) println // 0

// 3.
m := list(list(1,2,3,4),
          list(5,6,7,8),
          list(9,10,11,12),
          list(13,14,15,16))

List flatSum := method(
    matrix := call target flatten
    sum := 0
    matrix foreach(v, sum = sum + v)
    return sum
)

m flatSum println

// 4.
List myAverage := method(
    lst := call target
    sum := 0
    cnt := 0
    lst foreach(v,
        if (v proto != Number, Exception raise("Not a Number"))
        cnt = cnt + 1
        sum = sum + v
    )
    return sum/cnt
)

list(0, 50, 100) myAverage println
//list(0, "Error", 100) myAverage println

// 5. & 6. & 7. at 2dlist.io

// 8. 
guesser := method(
    num := Random value(0,100) floor
    num println
    guess := nil
    last_guess := 0
    tries := 10
    while(tries > 0 and guess != num,
        ("Guess my number! " .. (tries asNumber) .. " tries left") println
        guess := File standardInput readLine asNumber
        if(last_guess != nil,
            if( (last_guess - num) abs > (guess - num) abs, "hotter" println )
            if( (last_guess - num) abs < (guess - num) abs, "colder" println )
        )
        last_guess := guess
        tries = tries - 1
    )
    if (guess == num, "Success!" println, "Failure" println)
)

guesser