open OUnit2;;

(* the 7th pentanacci [k-step = 5] is 31; *)
let pentanacci _ = assert_equal 31 (Hw1.fib_k_step 5 7);;

(* fib_k_step (k : int) (n : int) : int =  *)
let fibKSuite = "fib_k_step suite" >::: [
    (* "k=0" *)
    "pentanacci" >:: pentanacci;
    "k=1" >:: (fun _ -> assert_equal 1 (Hw1.fib_k_step 1 100) ~printer:string_of_int);
    "negative nth fib number" >:: (fun _ -> assert_equal 0 (Hw1.fib_k_step 2 (-3)) ~printer:string_of_int);
]

let _ = run_test_tt_main fibKSuite

