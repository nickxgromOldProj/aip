const
   n = 10;
   wrd = 'электрофотополупроводниковый';
type
   st = array[1..n] of string;
var
   m: st;
   pr: string;
begin
   m[1] := copy(wrd, 19, 1) + copy(wrd, 3, 5);
   delete(m[1], 5, 1);
   m[1] := m[1] + copy(wrd, 6, 1);
   
   m[2] := copy(wrd, 10, 4) + copy(wrd, 5, 1);
   m[3] := copy(wrd, 10, 4) + copy(wrd, 6, 1);
   
   m[4] := m[1];
   delete(m[4], 1, 1);
   m[4] := copy(wrd, 2, 1) + m[4];
   
   m[5] := copy(wrd, 16, 6);
   
   m[6] := copy(wrd, 1, 7) + copy(wrd, 16, 6);
   
   m[7] := copy(wrd, 8, 3);
   insert(copy(wrd, 2, 1), m[7], 2);
   
   m[8] := copy(wrd, 16, 9);
   
   
   m[9] := m[8];
   delete(m[9], 1, 3);
   m[9] := copy(wrd, 12, 2) + copy(wrd, 21, 1) + m[9];
   
   m[10] := m[4] + pred('й') + copy(wrd, 28, 1);
   for i:byte := 1 to n do
      writeln(i, ') ', m[i]);
end.   