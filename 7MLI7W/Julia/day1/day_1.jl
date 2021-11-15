using LinearAlgebra

# 1.
println(typeof(Symbol))
println(typeof(Int64))
println(typeof(String))
# https://stackoverflow.com/questions/52351852/puzzling-results-for-julia-typeof
println(typeof(+))
println(typeof(*))

# 2.
typedDict = Dict{Symbol,Float64}()
typedDict[:isfloat] = 4.2
try
    typedDict[:thisis] = :notanumber
catch err
    println(err)
end

# 3.
A = Array{Int8,3}(undef, 5,5,5)
for k = 1:5
    for j = 1:5
        for i = 1:5
            A[i, j, k] = k
        end
    end
end
println(A)

# 4.
println(sin([1 2; 3 4]))

# 5.
B = [4 5 6 7 ; 1 2 3 8 ; 0 10 11 12 ; 6 7 8 9]
Bi = inv(B)
println(B* Bi ≈ I)

# 6.
dict1 = Dict(:a => 1, :b => 2, :e => 10)
dict2 = Dict(:c => 3, :d => 4, :e => 5)
dict12 = merge(dict1, dict2)
println(dict12)

# 7.
a = [1,65,8,56,3,654,9,76,980,23,143]
sort(a)
println(a)
sort!(a)
println(a)