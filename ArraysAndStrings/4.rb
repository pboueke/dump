def get_char_frequency_table(string)
    letters = Hash.new(0)
    string.each_char.reduce(letters) { |h, c| h[c] += 1; h}
    letters
end

# O(N)
def check_if_perm_could_be_palindrome(string)
    result = true
    found_odd = false
    get_char_frequency_table(string).each do | c, f |
        if f%2 == 1 
            if found_odd
                result = false
            end
            found_odd = true
        end
    end
    result
end

puts check_if_perm_could_be_palindrome("aabaa")
puts check_if_perm_could_be_palindrome("aaba")
puts check_if_perm_could_be_palindrome("aab")
puts check_if_perm_could_be_palindrome("aba")
puts check_if_perm_could_be_palindrome("aa")
puts check_if_perm_could_be_palindrome("aaacccd")