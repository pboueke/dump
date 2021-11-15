# 1
puts 'Hello, world'

# 2
puts 'Hello, Ruby'.index('Ruby')

# 3
i = 10
until i == 0 do
    puts 'Name'
    i = i - 1
end

# 4
i = 1
while i <= 10 do
    puts "This is sentence number #{i}"
    i = i + 1
end

# 5
number = rand(100)

puts "Guess my number, in between 1 to 100"

pick = 0

until pick == number do
    pick = gets.to_i

    puts "Lower" if pick > number
    puts "Higher" if pick < number
end

puts "Congrats, you found my number!"