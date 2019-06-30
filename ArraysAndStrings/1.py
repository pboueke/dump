def all_unique_chars(string):
    """Complexity: O(N)"""
    chars = set()
    for char in string:
        if char in chars:
            return False
        chars.add(char)
    return True

print(all_unique_chars("abcdefgh"))
print(all_unique_chars("aabbccdd"))

def all_unique_chars_no_data_structures(string):
    """Complexity: O(N log N)"""
    chars = sorted(string)
    for i in range(0,len(chars)-1):
        if chars[i] == chars[i+1]:
            return False
    return True

print(all_unique_chars_no_data_structures("abcdefgh"))
print(all_unique_chars_no_data_structures("aabbccdd"))