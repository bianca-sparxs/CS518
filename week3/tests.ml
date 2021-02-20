open QCheck
open Float
open OUnit

(* Q3.1 *)
let gen= Gen.list_size (Gen.int_range 5 10) (Gen.int_range 0 100)
let genlist = Gen.generate1( gen )
(* Q3.2 *)
let make = make gen;;

(* PROBLEM 3.3 HELPER *)
let rec is_even (a: 'a list) : bool = 
match a with
[] -> false
|hd::tl -> hd mod 2 = 0 || is_even tl


(* Q1 *)
let test =  Test.make  ~name:"reverse test" ~count:1000 (list float) (fun lst -> List.rev (List.rev lst) = lst);;
(* Q2 *)
let test2 = Test.make ~name: "floor x = truncate x" ~count:1000 float (fun x -> to_int (floor x) = truncate x);;
(* Q3.3 *)
let test3 =  Test.make ~name: "check if one number in lisr is even" ~count:1000 make (fun lst -> is_even lst)

(* Test.run_exn test;; *)
let _ = QCheck_runner.run_tests [
    test3;test2;test
]
