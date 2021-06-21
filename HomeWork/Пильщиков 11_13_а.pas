const
   s = '1234567890abcdefghijklmnopqr';
   t = '12345678*_@**!&*gh0123456';
var
 n: byte;
function search(s:string; n1, n2:byte; let1, let2: char):byte;
var k, i: byte;
begin
   for i := n1 to n2 do
      if s[i] in [let1..let2] then
         inc(k);
   search := k;
end;
begin
   if (search(s, 1, length(s) div 2, '0', '9')<12) and 
      (search(t, length(t) - length(t) div 4, length(t), 'a', 'z')=0) then
     n := search(t, length(t) div 4, length(t) - length(t) div 3, '*', '*'); 
     
   writeln(n);
end.