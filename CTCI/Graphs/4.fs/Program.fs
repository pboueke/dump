open System

type Tree =
    | Node of int * (Tree list)
    | Leaf of int
    | Null

let balancedTree = Node (1, 
                [Node (2, 
                    [Node (3,
                        [Node (4,
                            [Leaf 5])
                         Leaf 6])
                    ;Node (7,
                        [Leaf 8; 
                        Node (9,
                            [Leaf 10; 
                            Leaf 11])])]);
                Node (12,
                    [Node (13,
                        [Node (14,
                            [Leaf 15; 
                            Leaf 16])])])])

let imbalancedTree = Node (1,
                        [Node (2,
                            [Node (3, 
                                [Leaf 4])]);
                        Leaf 1])                        
                                                                                                            
let rec depth tree = 
    match tree with
    | Null -> 0
    | Leaf _ -> 1
    | Node (i,l) -> 1 + (l |> List.map depth |> List.max)

let balanced tree = 
    match tree with
    | Null -> true
    | Leaf _ -> true
    | Node (i,l) ->
        let depths = l |> List.map depth
        let max = depths |> List.max
        let min = depths |> List.min
        max - min < 2


[<EntryPoint>]
let main argv =
    printfn "%b \n" (balanced balancedTree)
    printfn "%b \n" (balanced imbalancedTree)
    0 
