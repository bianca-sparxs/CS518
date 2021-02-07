type 'a stream = Nil | Cons of 'a * (unit -> 'a stream)


(* test streams *)
let rec ones = 
Cons (1, fun () -> ones)
let rec twos = 
Cons (2, fun () -> twos)
let s = Cons(5, fun () -> Cons(2, fun() -> Cons(10, fun () -> Cons(11, fun () -> Nil))));;

(* helpers *)
let hd (a : 'a stream) = match a with
Nil -> failwith "hd"
|Cons(x,_) -> x

let tl (a : 'a stream) = match a with
Nil -> Nil
|Cons(_,tail) -> tail()

(* A *)
let read (strm: 'a stream) (def: 'a) : 'a * 'a stream = 
match strm with
Nil -> (def, Nil)
| Cons (x, fn) -> (x, fn())

(* B *)
let rec skip (strm : 'a stream) (fn: 'a -> bool) : 'a stream = 
match strm with 
Nil -> Nil
|Cons (x,tail) -> match fn x with 
    true -> Cons(x, fun() -> skip (tail()) fn)
    |false -> skip (tail()) fn

(* C *)
let rec mergeS (a : 'a stream) (b : 'a stream) : 'a stream  = 
match a with
Nil -> Nil 
|Cons (x, _) -> Cons(x, fun() -> mergeS b a)

(* D *)
let rec twoseq (a : 'a stream) (b : 'a stream) : 'a stream  = 
match a with
Nil -> b 
| Cons (x, tail) -> Cons (x, fun() -> twoseq (tail()) b)

(* E *)
let rec dupk (a : 'a) (k : int) (strm : 'a stream) : 'a stream = 
match k with 
| 0 -> strm
| k -> Cons(a, fun() -> dupk a (k-1) strm)

(* F *)
let rec repeatk (k : int)(strm : 'a stream) : 'a stream =  
match strm with
Nil -> Nil
| Cons(x, taill) -> twoseq (dupk x (k -1) Nil) (Cons(x, fun () -> repeatk k (tail ())))

(* G *)
