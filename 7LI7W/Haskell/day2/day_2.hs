module Day2 where
    import Data.List as L
    import Data.Text as T

    -- 1.
    remove _ [] = []
    remove n (h:t)
        | n == h = t
        | otherwise = h : remove n t

    mySort [] = []
    mySort list = min:rest
        where min = L.minimum list
              rest = mySort( remove min list )

    -- 2.
    mySortBy _ [] = []
    mySortBy fn list = min:rest
        where min = L.minimumBy fn list
              tmp = remove min list
              rest = mySortBy fn tmp

    -- 3.
    currencyToNum (_:number) = read digits :: Float
        where digits = L.filter (/= ',') number

    -- 4.
    takeFrom1 generator starting ammount = L.take ammount infinite
        where infinite = generator starting
    takeFrom2 generator sx sy ammount = L.take ammount infinite
        where infinite = generator sx sy
    everyThird x = [x, (x + 3)..]
    everyFifth x = [x, (x + 5)..]
    everyEighth x y = L.zipWith (+) (everyThird x) (everyFifth y)

    -- 5.
    half = (/ 2)
    myConcat x y = y ++ x
    breakLine = myConcat "\n"

    -- 6.
    gCD x y = L.maximum [a | a <- [1..x], b <- [1..y], a == b, mod x a == 0, mod y b == 0]

    -- 7.
    factors n = [x | x <- [1..n], mod n x == 0]
    primes = [x | x <- [1..], isPrime(x)]
        where isPrime n = factors n == [1,n]
