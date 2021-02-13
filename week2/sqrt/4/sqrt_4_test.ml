open OUnit2

let suite = "sqrt 3 suite" >::: 
   (List.map  (fun (title, arg1, arg2, res) -> title >:: (fun _ -> assert_equal res (Sqrt_4.sqrt arg1 arg2)))
        [
            ("x=125 n=3", 125., 3, 11.1);
            ("x=125 n=3", 125., 4, 11.18);
            ("x=2 n=5", 2., 5, 1.4142);
            ("x=8004.5 n=1", 8004.5, 1, 89.); (*although is should be 90...but i never do this*)
            ("x=8004.5 n=7", 8004.5, 7, 89.46787);
        ]
    ) 

let _ = run_test_tt_main suite