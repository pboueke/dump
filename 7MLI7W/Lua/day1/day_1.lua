-- 1.
function ends_in_3(num)
    return num % 10 == 3
end

print("1943 ends in 3?")
print(ends_in_3(1943))
print("2005 ends in 3?")
print(ends_in_3(20005))
print()

-- 2.
function is_prime(num)
    local factors = {}
    for i =1,num do
        if (num % i == 0) then
            table.insert(factors, i)
        end
    end
    return factors[2] == num
end

print("is 14 prime?")
print(is_prime(14))
print("is 29 prime?")
print(is_prime(29))
print()

-- 3.
function primes_in_3(n)
    local count = 0
    local iterator = 3
    local result = {}
    repeat
        iterator = iterator + 10
        if (is_prime(iterator)) then
            table.insert(result, iterator)
            count = count + 1
        end
    until(count == n)
    return result
end

print("First 10 primes ending in 3:")
print(table.concat(primes_in_3(10), ", "))
print()

-- 4.
function for_loop(a, b, f)
    local iterator = a
    while (iterator <= b) do
        f(iterator)
        iterator = iterator + 1
    end
end

print("First 5 numbers:")
for_loop(1,5,print)
print()

-- 5.
function reduce(max, init, f) 
    local acc = init
    for i=1,max do
        acc = f(acc, i)
    end
    return acc
end

function add(previous, next)
    return previous + next
end

print("Add up to 1500")
print(reduce(1500,0,add))
print()

-- 6.
function mult(previous, next) 
    return previous * next
end

print("10!")
print(reduce(10,1,mult))