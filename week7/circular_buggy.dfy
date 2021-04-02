/*
Consider an implementation of a circular buffer storing integers in Dafny.
A circular buffer starts empty, with some predefined capacity, specifying
how many elements it can hold. The size field stores information about how
many elements are currently stored in the buffer. As the buffer is circular,
it does not matter at which index in the buffer we start inserting elements,
this is given by the start field. Elements can then be added one by one, as
long as there is room in the buffer. Should we reach the end, we simply wrap
around and start inserting elements from the beginning of the buffer, where
there are still unallocated slots. Below is a skeletal implementation of a
class CircularBuffer:
*/


class CircularBuffer{
  var buffer : array?< int >;
  var capacity : int ;
  var size : int ;
  var start : int ;
  
  predicate Valid()
  reads this , this .buffer;
  {
    buffer != null &&
    capacity > 0 && buffer.Length == capacity &&
    0 <= start < buffer.Length &&
    0 <= size <= capacity
  }
  
  constructor(cap: int , startInd : int )
  // modifies this ;
  requires cap > 0 && 0 <= startInd < cap;
  ensures fresh (buffer);
  ensures Valid();
  ensures start == startInd;
  ensures forall i :: 0 <= i < buffer.Length ==> buffer[i] == 0;
  // PRECEDING LINE CAUSES THE FOLLOWING ERRORS:
  // Error: in the first division of the constructor body (before 'new;'), 'this' can only be used to assign to its fields
  // Error: in the first division of the constructor body (before 'new;'), 'this' can only be used to assign to its fields
  {
    size := 0;
    capacity := cap;
    start := startInd;
    buffer := new int [cap];
    forall (i | 0 <= i < buffer.Length) { buffer[i] := 0;}
  }
  
  method Add(elem : int )
  modifies this, this.buffer ;
  requires Valid() ;
  requires size < capacity ;
  ensures Valid() ;
  ensures size == old (size)+1;
  ensures exists i :: 0 <= i < buffer.Length && buffer[i] == elem;
  {
    var i := start+size;
    buffer[i%capacity] := elem;
    size := size+1;
  }
}

