module Day1 where
    
    -- 1.
    allEven1 :: [Integer] -> [Integer]
    allEven1 [] = []
    allEven1 (h:t) = if even h then h:allEven1 t else allEven1 t

    allEven2 :: [Integer] -> [Integer]
    allEven2 list = [ x | x <- list, even x]

    allEven3 :: [Integer] -> [Integer] 
    allEven3 list = filter even list

    -- 2.
    reversed :: [a] -> [a]
    reversed [] = []
    reversed (h:t) = (reversed t) ++ [h]

    -- 3.
    colors = ["black", "white", "blue"]
    combinations :: [([Char], [Char])]
    combinations = [ (x, y) | x <- colors, y <- colors, x < y]

    -- 4. 
    multiplicationTable :: Int -> [(Int, Int, Int)]
    multiplicationTable n = [(a, b, a * b) | a <- [1..n], b <- [1..n], a <= b]

    -- 5.
    colorize :: [([Char],[Char],[Char],[Char],[Char])]
    colorize = [(t,m,a,g,f) | t <- colors, m <- colors, a <- colors, g <- colors, f <- colors,
                              m /= t, m /= a,
                              a /= t, a /= g, a /= f,
                              g /= f, g /= t ]
