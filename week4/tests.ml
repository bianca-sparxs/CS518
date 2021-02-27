open QCheck

(**********************************************************)
(*  WARNING:  This code contains bugs!!!                  *)
(**********************************************************)

(* [odd_divisor x] is some odd divisor of [x]. *)
(* requires: [x] >= 0 *)
let odd_divisor x =
  if x<3 then 1 else
    let rec search y =
      if y>=x then y  (* exceeded upper bound *)
      else if x mod y = 0 then y  (* found a divisor! *)
      else search (y+2) (* skip evens *)
    in search 3

(* [max x y] is the maximum of [x] and [y] *)
let max x y =
  if x>y then y else x

(* [avg [x1; ...; xn] is ([x1] + ... + [xn])/n. *)
(* requires: the input list is not empty *)
let avg lst =
  (* optimization: this [loop] is more efficient
   * than folding over the list *)
  let rec loop (s,n) = function
    | [] -> (s,n)
    | [h] -> (s+h,n+1)
    | h1::h2::t -> if h1=h2 then loop (s+h1,n+1) t
                   else loop (s+h1+h2,n+2) t
  in
  let (s,n) = loop (0,0) lst
  in float_of_int s /. float_of_int n


(*Q1 -- odd divisor: The test fails on n > 3 *)
(* Q2 -- max*)
let pair_gen = make (Gen.pair Gen.int (Gen.int))

(*Q3 -- avg *)
let ref_avg lst =
  (float_of_int (List.fold_left (+) 0 lst)) /. (float_of_int (List.length lst))

let odd = Test.make ~count:1000 ~name:"odd divisor" (make (Gen.int_range 0 4)) (fun x ->  (x mod (odd_divisor x)) = 0 && (odd_divisor x) mod 2 = 1);;
let max = Test.make ~count:1000 ~name:"max check" pair_gen (fun (x,y) ->  (((max x y) >= x && (max x y) >= y) && ((max x y) == y || (max x y) == x)));;
let avg_test = Test.make ~count:1000 ~name:"avg check" (list small_nat) (fun x ->  ref_avg x = avg x);;

(*Q1 -- odd divisor
The test hangs (lul) on n > 3, I'm assuming that's the bug...
*)

let _ = QCheck_runner.run_tests [odd;max;avg_test]

