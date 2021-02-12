open OUnit2

let zeroone _ = assert_equal 0. (Sqrt_1.sqrt 0. 1)

let suite = "sqrt one test" >::: ["x=0 n=0" >:: zeroone;]

let _ = run_test_tt_main suite