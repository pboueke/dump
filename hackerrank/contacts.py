
#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'contacts' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts 2D_STRING_ARRAY queries as parameter.

class Node:
    def __init__(self, value):
        self.value = value
        self.children = {}
        self.words = 0

    def add_word(self, word):
        if word == "":
            return
        if word[0] not in self.children.keys():
            self.children[word[0]] = Node(word[0])
        self.words += 1
        self.children[word[0]].add_word(word[1::])

    def search_prefix(self, pref):
        head = pref.pop(0)
        if head in self.children.keys():
            print(f'p:{pref}, head:{head}, chld:{len(self.children[head].children)}, wd:{self.words}')
            if len(pref) == 0:
                return self.children[head].words
            return self.children[head].search_prefix(pref)
        else:
            return 0

def contacts(queries):
    res = []
    root = Node("")
    for q in queries:
        command, value = q.split(" ")
        if command == "add":
            root.add_word(value)
        else:
            res.append(root.search_prefix(list(value)))
    return res

# print(contacts(['add hack', 'add hackerrank', 'find hac', 'find hak']))

print(contacts(['add maria', 'add mario', 'find mar', 'find mario']))

print(contacts(["add s", "add ss", "add sss", "add ssss", "add sssss", "find s", "find ss", "find sss", "find ssss", "find sssss", "find ssssss"]))

#if __name__ == '__main__':
#    fptr = open(os.environ['OUTPUT_PATH'], 'w')
#
#    queries_rows = int(input().strip())
#
#    queries = []
#
#    for _ in range(queries_rows):
#        queries.append(input().rstrip().split())
#
#    result = contacts(queries)
#
#    fptr.write('\n'.join(map(str, result)))
#    fptr.write('\n')
#
#    fptr.close()
