let rec prod (lis : int list) : int = 
match lis with
[] -> 1
| hd::tl -> hd * hd * prod tl (*bug*)