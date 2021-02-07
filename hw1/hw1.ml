let rec tetra1 (a : int) : int = 
    match a with
    | 0 -> 0
    | 1 -> 1
    | 2 -> 1
    | 3 -> 2
    | _ -> tetra1 (a-1) + tetra1 (a-2) + tetra1 (a-3) + tetra1 (a-4)

(* Bonus Q:  this will be called 4^n times worst case *)

let sum_top_4 (lis : int list) : int list = 
    match lis with
    | [] -> []
    | a::b::c::d::tl -> (a+b+c+d)::lis
    | _ -> lis

let rec ascending (n : int) : int list = 
    match n with 
    | -1 -> []
    | n -> ascending (n-1) @ [n] 

let tetra2 (bound : int) : int =
    let starter = [2;1;1;0] in 
    let rec adder (a : int) (lis : int list) : int list = 
        match a with
        | 3 -> lis
        | a -> adder (a-1) (sum_top_4 lis)
         in
    match bound with 
    | 0 -> 0 
    | 1 -> 1
    | 2 -> 1
    | 3 -> 2
    | n ->  List.hd (adder bound starter)

(* Q3 *)
let sum_top_k  (k :int) (lis : int list) : int = 
    match lis with
    [] -> 0
    | _ when List.length lis < k -> 
    let rec adder (list: int list) : int =
        match list with
        [] -> 0
        | hd::tl -> hd + adder tl in 
    adder lis

    | _ ->
    let rec k_adder (i: int) (list: int list) : int =
        match i with
        0 -> 0
        | i -> List.hd list + k_adder (i-1) (List.tl list) in 
    k_adder k lis

let fib_k_step (k : int) (n : int) : int = 
    let starter = [1;1;0] in 
        let rec adder (a : int) (lis : int list) : int list = 
            match a with
            | 2 -> lis
            | a -> adder (a-1) ([sum_top_k k lis] @ lis)
            in
        match n with 
        | _ when n <= 0 -> 0 
        | 1 -> 1
        | 2 -> 1
        | n ->  List.hd (adder n starter)

type 'a binTree =
| Leaf
| Node of 'a * ('a binTree) * ('a binTree)

let rec mapT (fn : 'a -> 'b) (tree : 'a binTree) : 'b binTree = 
match tree with 
Leaf -> Leaf
|Node (data, l, r) -> Node (fn data, mapT fn l, mapT fn r)

(* 
let tree = Node(5, Node(4, Leaf, Leaf), Node(3,Leaf,Leaf));;
mapT parity tree;; 
 *)

let rec foldT (fn: 'a -> 'b -> 'b -> 'b) (tree: 'a binTree) (accumltr: 'b) : 'b  = 
match tree with
| Leaf -> accumltr
| Node (data, l, r) -> fn data (foldT fn l accumltr) (foldT fn r accumltr)