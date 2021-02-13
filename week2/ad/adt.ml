let addTests = "test suite for add" >::: 
   ( List.map ( fun(title, arg1, arg2, res) -> title >:: (fun _ -> assert_equal res (Ute.add arg1 arg2)))
        [("zero", 0, 0, 0); ("seven + zero", 0, 7, 7);
        ("one + two", 1, 2, 3); ("seven + neg. seven", (-7), 7, 0); ]
    ) 