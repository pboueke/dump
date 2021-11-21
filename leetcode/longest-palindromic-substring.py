import unittest

class Solution:
    max_palindrome = ""
    def longestPalindrome(self, s: str) -> str:
        for i in range(len(s)):
            self.extend(s, i, i)
            self.extend(s, i, i+1)

        return self.max_palindrome

    def extend(self, s, left, right):
        while right < len(s) and left >= 0 and s[left] == s[right]:
            # print(f'left:{left}, right:{right}, new:{s[left:right+1]}, curr:{self.max_palindrome}')
            if (right - left > len(self.max_palindrome) - 1):
                self.max_palindrome = s[left:right + 1]
            left -= 1
            right += 1


        
class TestLongestPalindrome(unittest.TestCase):
    def test_solution_ex1_ok(self):
        res = Solution().longestPalindrome("babad")
        self.assertEqual(res, "bab")
    
    def test_solution_ex2_ok(self):
        res = Solution().longestPalindrome("cbbd")
        self.assertEqual(res, "bb")

    def test_solution_ex3_ok(self):
        res = Solution().longestPalindrome("a")
        self.assertEqual(res, "a")

    def test_solution_ex4_ok(self):
        res = Solution().longestPalindrome("ac")
        self.assertEqual(res, "a")

    def test_solution_my1_ok(self):
        res = Solution().longestPalindrome("asdredderlll")
        self.assertEqual(res, "redder")

    def test_solution_my2_ok(self):
        res = Solution().longestPalindrome("d12345678987654321gfdsaerth")
        self.assertEqual(res, "12345678987654321")

unittest.main()

