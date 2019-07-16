package main

import (
	"fmt"
)

func push(stack *[]int, value int) {
	*stack = append(*stack, value)
}

func pop(stack *[]int) int {
	n := len(*stack) - 1
	val := (*stack)[n]
	*stack = (*stack)[:n]
	return val
}

type MyQueue struct {
	main, aux []int
}

func enqueue(queue *MyQueue, value int) {
	push(&queue.main, value)
}

func dequeue(queue *MyQueue) int {
	counter, size := 0, len(queue.main)
	for (counter < size - 1) {
		push(&queue.aux, pop(&queue.main))
		counter += 1
	}
	val := pop(&queue.main)
	for (counter > 0) {
		push(&queue.main, pop(&queue.aux))
		counter -= 1
	}
	return val
}

func main() {

	// stack behavior
	stack := &[]int{1,2,3,4,5}
	push(stack, 1)
	fmt.Printf("%v\n", stack)
	pop(stack)
	fmt.Printf("%v\n\n", stack)

	queue := &MyQueue{main: []int{}, aux: []int{}}
	enqueue(queue, 1)
	enqueue(queue, 2)
	enqueue(queue, 3)
	enqueue(queue, 4)
	fmt.Printf("%v\n", queue.main)
	fmt.Printf("%d, %v\n", dequeue(queue), queue.main)
	fmt.Printf("%d, %v\n", dequeue(queue), queue.main)
}