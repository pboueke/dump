class TreeNode:
    value = None
    left = None
    right = None
    parent = None
    
    def __init__(self, value):
        self.value = value

    def add_child(self, node):
        if node.value > self.value:
            if self.right is None:
                self.right = node
                node.parent = self
            else:
                self.right.add_child(node)
        else:
            if self.left is None:
                self.left = node
                node.parent = self
            else:
                self.left.add_child(node)

    def next(self):
        if self.right is not None:
            curr = self.right
            while curr.left is not None:
                curr = curr.left
            return curr
        elif self.parent is not None:
            if self.parent.left == self:
                return self.parent
            else:
                curr = self.parent
                while curr.value < self.value:
                    curr = curr.parent
                return curr
        return None
 
root = TreeNode(100)             #                    100
a = TreeNode(1)                  #                   /   \ 
root.add_child(a)                #                  1     789
b = TreeNode(67)                 #                   \
root.add_child(b)                #                    67___
c = TreeNode(14)                 #                   /     \
root.add_child(c)                #                  14     99
d = TreeNode(99)                 #                 / \     
root.add_child(d)                #                4  23   
e = TreeNode(23)                 #                    \ 
root.add_child(e)                #                     45
f = TreeNode(4)                  #
root.add_child(f)                #
g = TreeNode(45)
root.add_child(g)
h = TreeNode(789)
root.add_child(h)

next = a.next()
print(next.value)
next = b.next()
print(next.value)
next = c.next()
print(next.value)
next = d.next()
print(next.value)
next = e.next()
print(next.value)
next = f.next()
print(next.value)
next = g.next()
print(next.value)
next = h.next()
print(next.value)