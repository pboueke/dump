open System

type Tree =
    | Node of Map<int, Tree list>
    | Leaf of int

let rec recur data = 
    printf "=> %A \n" data
    match data with
    | [H] ->
        printf "Leaf: %i \n" H
        Leaf H
    | [H;T] ->
        printf "Node: %i \n" H
        Node ([(H, [recur([T]); Leaf -1])] |> Map.ofSeq)
    | _ -> 
        let half = data.Length/2
        let H = data.[0..(half-1)]
        let T = data.[(half+1)..(data.Length-1)]
        let M = data.[half]
        printf "Node: %i \n" M
        Node ([(M, [recur(H); recur(T)])] |> Map.ofSeq)

let data1 = [3;4;6;8;10;12;14;16]
let data2 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16]

[<EntryPoint>]
let main argv =
    let tree1 = recur data1
    let tree2 = recur data2
    0 
