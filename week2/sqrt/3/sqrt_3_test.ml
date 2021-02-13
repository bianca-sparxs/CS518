open OUnit2

let suite = "sqrt 3 suite" >::: 
   (List.map  (fun (title, arg2, res) -> title >:: (fun _ -> assert_equal res (Sqrt_3.sqrt (0.) arg2)))
        [
            ("n=1", 1, 0.);
            ("n=20", 20, 0.);
        ]
    ) 

let _ = run_test_tt_main suite