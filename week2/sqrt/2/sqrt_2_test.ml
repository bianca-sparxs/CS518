open OUnit2

let suite = "sqrt 2 suite" >::: 
   (List.map  (fun (title, arg1, res) -> title >:: (fun _ -> assert_equal res (Sqrt_2.sqrt arg1 (1))))
        [
            ("sqrt 121 == 10. at one significant figure", 121., 10.); (* although i never fix this sadface *)
            ("sqrt 24 == 4. when n = 1", 24., 4.);
            ("sqrt 0.5 == 0.7 when n = 1", 0.5, 0.7); 
        ]
    ) 

let _ = run_test_tt_main suite