let string_of_float (x: float) (sigfig: int): string = 
let (decml, whole) = Float.modf x in
let digits_decml = Float.to_string decml in
let digits_whole = Float.to_string whole in 
let rmndr_sigfig = (String.length (digits_whole) - 1) - sigfig in
match rmndr_sigfig with
| 0 -> (
    match (whole, decml) with
    (0., 0.) -> "1." (* <----- BUG -----> *)
    |(0., _) -> digits_whole ^ String.make 1 (digits_decml.[2])
    |(x, _) -> digits_whole
)
| _ when rmndr_sigfig < 0 ->
    if (String.length (digits_decml) - 2) >= (abs rmndr_sigfig) then 
    digits_whole ^ String.sub digits_decml 2 (abs rmndr_sigfig) else
    let trail_zeros = String.make ((abs rmndr_sigfig) - (String.length (digits_decml) - 2)) '0' in
    digits_whole ^ String.sub digits_decml 2 ((String.length digits_decml) - 2) ^ trail_zeros
| _ -> String.sub digits_whole 0 ((String.length digits_whole) - 2) (* <----- BUG -----> *)


let sqrt (x : float) (sigfig : int) : float = 
let s = string_of_float(Float.sqrt x) sigfig in 
Float.of_string s