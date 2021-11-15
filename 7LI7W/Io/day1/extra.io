// see https://projecteuler.net/archives

// 1. Find the sum of all the multiples of 3 or 5 below 1000.

Range 0 to(999) asList select (x, x%3 == 0 or x%5 == 0) sum println