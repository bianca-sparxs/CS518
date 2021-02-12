let rec prod (lis : int list) : int = 
match lis with
[] -> 1
| hd::tl -> hd * hd * prod tl (*bug*)

let rec concat (lis : string list) : string = 
match lis with 
[] -> " "
| [str] -> str
| s::strs -> concat strs ^ s (*bug*)

let add x y = 
if x mod 7 = 0 then 0 (*bug*)
else x+y

(* this was so overkill b/c i wanted to round up but 
i didn't do it anyways triggered but shwatever *)

let string_of_float (x: float) (sigfig: int): string = 
let (decml, whole) = Float.modf x in
let digits_decml = Float.to_string decml in
let digits_whole = Float.to_string whole in 
let rmndr_sigfig = (String.length (digits_whole) - 1) - sigfig in
match rmndr_sigfig with
| 0 -> digits_whole ^ String.make 1 (digits_decml.[2])
| _ when rmndr_sigfig < 0 ->
    if (String.length (digits_decml) - 2) >= (abs rmndr_sigfig) then 
    digits_whole ^ String.sub digits_decml 2 (abs rmndr_sigfig) else
    let trail_zeros = String.make ((abs rmndr_sigfig) - (String.length (digits_decml) - 2)) '0' in
    digits_whole ^ String.sub digits_decml 2 ((String.length digits_decml) - 2) ^ trail_zeros
| _ -> String.sub digits_whole 0 ((String.length digits_whole) -1)
(* Printf.sprintf "%.72f" decml *)

let sqrt (x : float) (sigfig : int) : float = 
let s = string_of_float(Float.sqrt x) sigfig in 
Float.of_string s





