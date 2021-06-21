const
   s = '----,-';
var
   yeah: boolean;
   i: byte;
begin
   i := 1;
   while not(yeah) and (i<length(s)) do
   begin
      if (pos(',-', s[i] + s[i+1])>0) then
         yeah := true;
      inc(i);
   end;
   writeln(yeah);
end.