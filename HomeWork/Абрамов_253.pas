uses crt;
const
//      1234567890...
   s = '..,.,...';
var
   i, h:byte; 
function dots_count(i:byte):byte;
var j:byte;
begin
   j := i+1;
   while (s[j]='.') and (j<length(s)) do
      inc(j);
   dots_count := j-i;
end;

begin
   i := 1;
   while i<length(s) do
   begin
      if s[i] = '.' then
      begin
         writeln(dots_count(i));
         i := i + dots_count(i); 
      end
      else
         inc(i);
   end;
end.