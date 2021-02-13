let rec concat (lis : string list) : string = 
match lis with 
[] -> " "
| [str] -> str
| s::strs -> concat strs ^ s (*bug*)