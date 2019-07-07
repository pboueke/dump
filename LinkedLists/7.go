package main

import (
	"fmt"
)

type Node struct {
	value int
	next *Node
}

type LinkedList struct {
	head *Node
}

func AddTail(ll *LinkedList, value int) {
	if ll.head == nil {
		ll.head = &(Node { value: value })
	} else {
		var curr *Node = ll.head
		for curr.next != nil {
			curr = curr.next
		}
		curr.next = &(Node { value: value })
	}
}

func PrintList(ll *LinkedList) {
	var curr *Node = ll.head
	for curr != nil {
		fmt.Printf("[%d] -> ", curr.value)
		curr = curr.next
	}
	fmt.Printf("\n")
}

func Abs(x int) int {
	if x < 0 {
			return -x
	}
	return x
}

func intersect(l1 *LinkedList, l2 *LinkedList) bool {
	var curr1 *Node = l1.head
	for curr1.next != nil {
		curr1 = curr1.next
	}
	var curr2 *Node = l2.head
	for curr2.next != nil {
		curr2 = curr2.next
	}
	return curr1 == curr2
}

func listLenght(ll *LinkedList) int {
	counter := 0
	var curr *Node = ll.head
	for curr != nil {
		counter += 1
		curr = curr.next
	}
	return counter
}

func intersection(l1 *LinkedList, l2 *LinkedList) *Node {
	if !intersect(l1,l2) {
		return nil
	}

	c1, c2, size := listLenght(l1), listLenght(l2), 0
	diff := Abs(c1 - c2)

	var big, small *Node
	if c1 > c2 {
		big = l1.head
		small  = l2.head
		size = c2
	} else {
		big = l2.head
		small = l1.head
		size = c1
	}

	for i := 0; i < diff; i++ {
		big = big.next
	}

	var intersection *Node = nil
	for i := 0; i < size; i++ {
		if big == small && intersection == nil {
			intersection = big
		} else if (big != small) {
			intersection = nil
		}
		big = big.next
		small = small.next
	}
	return intersection

}


func main() {

	var ll1 *LinkedList = &(LinkedList { head: nil})
	AddTail(ll1, 1)
	AddTail(ll1, 5)
	AddTail(ll1, 9)
	AddTail(ll1, 7)
	AddTail(ll1, 2)
	AddTail(ll1, 1)
	PrintList(ll1)
	var ll2 *LinkedList = &(LinkedList { head: nil})
	AddTail(ll2, 4)
	AddTail(ll2, 6)
	ll2.head.next.next = ll1.head.next.next.next
	PrintList(ll2)
	var ll3 *LinkedList = &(LinkedList { head: nil})
	AddTail(ll3, 3)
	AddTail(ll3, 7)
	AddTail(ll3, 2)
	AddTail(ll3, 1)
	PrintList(ll3)
	
	if !intersect(ll1,ll2) {
		panic("ll1 and ll2 should intersect")
	}
	if intersect(ll1,ll3) {
		panic("ll1 and ll3 shouldn't intersect")
	}
	if intersection(ll1,ll2) != ll2.head.next.next {
		panic("ll1 and ll2 should intersect at 7")
	}
	if intersection(ll1,ll3) != nil {
		panic("ll1 and ll2 have no intersection")
	}

}