open System

type Tree =
    | Node of int * (Tree list)
    | Leaf of int
    | Null

let getNodeValue node =
    match node with
    | Leaf i -> i
    | Node (i,_) -> i
    | Null -> 0 // no op

let rec checkBst tree = 
    match tree with
    | Null -> true
    | Leaf _ -> true
    | Node (i,l) ->
        getNodeValue(l.[0]) < i 
        && getNodeValue(l.[1]) >= i
        && checkBst(l.[0])
        && checkBst(l.[1])

let rec makeBST data = 
    match data with
    | [H] ->
        Leaf H
    | [H;T] ->
        match H > T with
        | true -> Node (H, [makeBST([T]); Null])
        | false -> Node (H, [Null; makeBST([T])])
    | _ -> 
        let half = data.Length/2
        let H = data.[0..(half-1)]
        let T = data.[(half+1)..(data.Length-1)]
        let M = data.[half]
        Node (M, [makeBST(H); makeBST(T)])

let bst = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16] |> makeBST

let nonBst = Node (1, 
                [Node (2, 
                    [Node (3,
                        [Node (4,
                            [Leaf 5;Leaf 5])
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
                            Leaf 16]);
                        Leaf 17]);
                    Leaf 18])])

[<EntryPoint>]
let main argv =
    printfn "%b \n" (checkBst bst)
    printfn "%b \n" (checkBst nonBst)
    0 
