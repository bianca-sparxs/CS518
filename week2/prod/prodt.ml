(* let rec prod (lis : int list) : int  *)
let prodTests = "test suite for prod" >::: [
    "empty" >:: (fun _ -> assert_equal 1 (Ute.prod ([])) );
    "zero" >:: (fun _ -> assert_equal 0 (Ute.prod ([0])) );
    "prod n = n" >:: (fun _ -> assert_equal 10 (Ute.prod ([10]))~printer:string_of_int);
    "prod n = n pt.2" >:: (fun _ -> assert_equal 1110 (Ute.prod ([1110]))~printer:string_of_int);
    "1^3 = 1" >:: (fun _ -> assert_equal 1 (Ute.prod ([1;1;1]))~printer:string_of_int);
    "2^3 = 8" >:: (fun _ -> assert_equal 8 (Ute.prod ([2;2;2]))~printer:string_of_int);
    "2 * 3 = 6" >:: (fun _ -> assert_equal 6 (Ute.prod ([2;3]))~printer:string_of_int);
]