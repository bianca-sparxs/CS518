(* let rec concat (lis : string list) : string =  *)
let concatTests = "test suite for concat" >::: [
    "empty" >:: (fun _ -> assert_equal " " (Ute.concat ([])));
    "single string" >:: (fun _ -> assert_equal "hi" (Ute.concat (["hi"])));
    "single double" >:: (fun _ -> assert_equal "aaa" (Ute.concat (["a";"aa"])));
    "double double" >:: (fun _ -> assert_equal "aaaa" (Ute.concat (["aa"; "aa"])));
    "hello goodbye" >:: (fun _ -> assert_equal "hellogoodbye" (Ute.concat (["hello";"goodbye"])));
    "symbols" >:: (fun _ -> assert_equal "1+2" (Ute.concat (["1";"+";"2"])));
]