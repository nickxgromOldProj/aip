const
   n = 10;
var
   s: array[1..n] of char;
   i, sum1, sum2, sum3: byte;
begin
   for i := 1 to n do
   begin
      s[i] := chr(random(47));
      write(s[i]:2);
   end;
   
   for i := 1 to n do
   begin
    if pos('+', s[i]) > 0 then
      inc(sum1);
    
    if pos('*', s[i]) > 0 then
      inc(sum2);
      
    if pos('-', s[i]) > 0 then
      inc(sum3);

   end;
   writeln;
   writeln;
   writeln('Кол-во встретившийся сиволов "+" в последовательности: ', sum1);
   writeln('Кол-во встретившийся сиволов "*" в последовательности: ', sum2);
   writeln('Кол-во встретившийся сиволов "-" в последовательности: ', sum3);
   writeln('Общее кол-во встретившийся сиволов "+", "-" и "*" в последовательности: ', sum1+sum2+sum3);
end.