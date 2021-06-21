uses crt;
var
   s: string;
   c: char;
   i:byte;
begin
   s := 'работоспособность';
   c := 'о';
   inc(i);
   while i<=length(s) do
   begin
        if s[i] = c then
        begin
           insert(c, s, i);
           i := i+2;
        end
        else
            inc(i);
   end;

   writeln(s);
end.