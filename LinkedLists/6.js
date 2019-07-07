class Node {
    constructor(value) {
        this.value = value
        this.next = null
        this.prev = null
    }
}

class LinkedList {
    constructor() {
        this.head = null
        this.tail = null
    }

    add_tail(value) {
        if (this.head == null) {
            this.head = new Node(value)
        } else {
            let curr = this.head
            while (curr.next != null) {
                curr = curr.next
            }
            curr.next = new Node(value)
            curr.next.prev = curr
            this.tail = curr.next
        }
    }

    print() {
        let curr = this.head
        while (curr != null) {
            console.log(curr.value)
            curr = curr.next
        }
        console.log("")
    }

    isPalindrome() {
        let head = this.head
        let tail = this.tail
        while(head != null && tail != null && head != tail) {
            if (head.value != tail.value) {
                return false
            }
            head = head.next
            tail = tail.prev
        }
        return true
    }
}



let ll = new LinkedList()
ll.add_tail(1)
ll.add_tail(2)
ll.add_tail(1)
ll.add_tail(3)
ll.add_tail(1)
ll.add_tail(2)
ll.add_tail(1)
ll.print()
console.log(ll.isPalindrome())