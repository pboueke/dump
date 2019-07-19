// Learn more about F# at http://fsharp.org

open System

type Tree =
    | Node of Map<int, Tree list>
    | Leaf of int

let rec recur data = 
    match data with
    | [H] ->
        Leaf H
    | [H;T] ->
        Node ([(H, [recur([T]); Leaf -1])] |> Map.ofSeq)
    | [H;M;T] ->
        Node ([(M, [recur([H]); recur([T])])] |> Map.ofSeq)
    | _ -> 
        let half = data.Length/2
        let H = data.[0..(half-1)]
        let T = data.[(half+1)..(data.Length-1)]
        let M = data.[half]
        Node ([(M, [recur(H); recur(T)])] |> Map.ofSeq)

let data = [3;4;6;8;10;12;14;16]

[<EntryPoint>]
let main argv =
    let tree = recur data
    0 
