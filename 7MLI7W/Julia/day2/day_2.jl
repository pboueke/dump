using Distributed;
import Base.+

# 1.
for i = 10:-1:1
    println(i)
end

# 2.
A = [1 2 3; 4 5 6; 7 8 9]
println(A)
for i = 1:size(A, 2)
    for j = 1:size(A, 1)
        println(A[i, j])
    end
end

# 3.
@everywhere function flip_coin(times)
    count = 0
    for i=1:times
        count += Int(rand(Bool))
    end
    count
end

println(flip_coin(10000))

@everywhere function pflip_coin(times)
    @distributed (+) for i=1:times
        Int(rand(Bool))
    end
end 

flips = pmap(pflip_coin, [10000 10000 10000 10000 10000])
println(flips)

# 4.
function fact(n)
    @distributed (*) for i = 1:n
        i
    end
end

println(fact(10))

# 5.
function concat(i::Int64, A::Array{Int64,2})
    B = ones(size(A,1),size(A,2)) * i
    C = Array{Int64,2}(undef,size(A,1),size(A,2)*2)
    for i = 1:size(A,1)
        C[i,:] = append!(B[i,:],A[i,:])
    end
    C
end

println(concat(5, [1 2; 3 4]))
println(concat(6, [1 2 3; 4 5 6]))

# 6.
function +(s1::String, s2::String)
    "$s1$s2"
end

println("jul" + "ia")

# 6.
times = 5000000000

@everywhere function pflip_coin_spawn(times, processes)
    partial_times = div(times, processes)
    last_partial_times = times - (partial_times * (processes - 1))
    futures = [@spawn flip_coin(last_partial_times)]
    for i = 1:(processes-1)
        append!(futures, [@spawn flip_coin(partial_times)])
    end 
    results = map(x -> fetch(x), futures)
    reduce(+, results, init=0)
end

# remember to launch the program with -p N
@time pflip_coin_spawn(times, 8)
@time pflip_coin(times)
@time flip_coin(times)
