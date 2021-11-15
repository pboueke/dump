package main

import "fmt"

func rotate(matrix [][]int) [][]int {
	N := len(matrix)
	result := make([][]int, N)
	var i, j int
	for i := range result {
		result[i] = make([]int, N)
	}

	for i = 0; i < N; i ++ {
		for j = 0; j < N; j ++ {
			result[j][N-1-i] = matrix[i][j]
		}
	}

	return result
}

func main() {
	var matrix = [][]int {
		{0,  1,  2,  3},  // {12, 8,  4, 0}, (0,j)->(j,N-0)
		{4,  5,  6,  7},  // {13, 9,  5, 1}, (1,j)->(j,N-1)
		{8,  9,  10, 11}, // {14, 10, 6, 2}, (2,j)->(j,N-2)
		{12, 13, 14, 15}, // {15, 11, 7, 3}, (3,j)->(j,N-3)
	}

	var i, j int
	fmt.Printf("Original: \n")
	for  i = 0; i < 4; i++ {
		for j = 0; j < 4; j++ {
		   fmt.Printf("a[%d][%d] = %d\n", i,j, matrix[i][j] )
		}
	 }

	 var rotated = rotate(matrix)
	 
	 fmt.Printf("Rotated: \n")
	 for  i = 0; i < 4; i++ {
		for j = 0; j < 4; j++ {
		   fmt.Printf("a[%d][%d] = %d\n", i,j, rotated[i][j] )
		}
	 }
}