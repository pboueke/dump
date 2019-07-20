open System

type Tree =
    | Node of int * (Tree list)
    | Leaf of int

let rec treeToString tree (level: int) =
    match tree with
    | Leaf i ->
        String.Format("{0} Leaf {1}", String.replicate level " | ", i)
    | Node (i,l) ->
        String.Format("{3}Node {0}\n {3}|1>{1}\n {3}|2>{2}", 
            i, 
            treeToString l.[0] (level + 1), 
            treeToString l.[1] (level + 1), 
            String.replicate level " | ")

let rec recur data = 
    match data with
    | [H] ->
        Leaf H
    | [H;T] ->
        Node (H, [recur([T]); Leaf -1])
    | _ -> 
        let half = data.Length/2
        let H = data.[0..(half-1)]
        let T = data.[(half+1)..(data.Length-1)]
        let M = data.[half]
        Node (M, [recur(H); recur(T)])

let data1 = [3;4;6;8;10;12;14;16]
let data2 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16]

[<EntryPoint>]
let main argv =
    let treefy = recur >> treeToString
    let tree1 = treefy data1 0
    let tree2 = treefy data2 0
    printf "%s \n" tree1
    printf "%s \n" tree2
    0 
