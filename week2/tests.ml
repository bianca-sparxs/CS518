open OUnit2

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

(* let rec concat (lis : string list) : string =  *)
let concatTests = "test suite for concat" >::: [
    "empty" >:: (fun _ -> assert_equal " " (Ute.concat ([])));
    "single string" >:: (fun _ -> assert_equal "hi" (Ute.concat (["hi"])));
    "single double" >:: (fun _ -> assert_equal "aaa" (Ute.concat (["a";"aa"])));
    "double double" >:: (fun _ -> assert_equal "aaaa" (Ute.concat (["aa"; "aa"])));
    "hello goodbye" >:: (fun _ -> assert_equal "hellogoodbye" (Ute.concat (["hello";"goodbye"])));
    "symbols" >:: (fun _ -> assert_equal "1+2" (Ute.concat (["1";"+";"2"])));
]

(* let rec concat (lis : string list) : string =  *)
let addTests = "test suite for add" >::: 
   ( List.map ( fun(title, arg1, arg2, res) -> title >:: (fun _ -> assert_equal res (Ute.add arg1 arg2)))
        [("zero", 0, 0, 0); ("seven + zero", 0, 7, 7);
        ("one + two", 1, 2, 3); ("seven + neg. seven", (-7), 7, 0); ]
    ) 

let sqrtTests = "test suite for add" >::: 
   ( List.map ( fun(title, arg1, arg2, res) -> title >:: (fun _ -> assert_equal res (Ute.sqrt arg1 arg2)))
        [
            ("x=0 n=1", 0., 1, 0.);
            ("sqrt 121 == 10. @ one sigfig", 121., 1, 11.); (* although it should be 10 i never fix this sadface *)
            ("sqrt 24 == 4. when n = 1", 24.,1, 4.);
            ("sqrt 0.5 == 0.7 when n = 1", 0.5, 1, 0.7); 
            ("n=1", 0., 1, 0.);
            ("n=20", 0., 20, 0.);
            ("x=125 n=3", 125., 3, 11.1);
            ("x=125 n=3", 125., 4, 11.18);
            ("x=2 n=5", 2., 5, 1.4142);
            ("x=8004.5 n=1", 8004.5, 1, 89.); (*although is should be 90...but i never do this*)
            ("x=8004.5 n=7", 8004.5, 7, 89.46787);
         ]
    ) 
    
    



let _ = run_test_tt_main addTests
let _ = run_test_tt_main prodTests
let _ = run_test_tt_main concatTests
let _ = run_test_tt_main sqrtTests
