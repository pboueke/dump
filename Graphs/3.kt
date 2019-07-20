class LinkedListNode<T>(value: T){
    var value:T = value
    var next: LinkedListNode<T>? = null
}

class TreeNode<T>(value: T){
    var value:T = value
    var left:TreeNode<T>? = null
    
    var right:TreeNode<T>? = null
}

fun makeLists(tree: TreeNode<Int>?, lists: MutableMap<Int, LinkedListNode<Int>>, level: Int) {
    if (tree == null) {
        return
    }
    if (level in lists) {
        var curr = lists[level]
        while (curr?.next != null) {
            curr = curr?.next
        }
        curr?.next = LinkedListNode(tree.value)
    } else {
        lists[level] = LinkedListNode(tree.value)
    }
    makeLists(tree.left, lists, level + 1)
    makeLists(tree.right, lists, level + 1)
}

fun main() {
    var lists = mutableMapOf<Int,LinkedListNode<Int>>()
    val tree = TreeNode(10)                 //                     10   
    tree.left = TreeNode(5)                 //                   /    \
    tree.left?.left = TreeNode(2)           //                  5      15
    tree.left?.right = TreeNode(7)          //               /   \     /   \
    tree.left?.right?.right = TreeNode(9)   //              2     7   12   20
    tree.right = TreeNode(15)               //                     \
    tree.right?.left = TreeNode(12)         //                      9
    tree.right?.right = TreeNode(20)
    makeLists(tree, lists, 0)

     for ((k, v) in lists) {
        print("List in level $k of value: ")
        print(v.value)
        var node = v.next
        while (node != null) {
            print("->")
            print(node.value)
            node = node.next
        }
        print("\n")
    }
}