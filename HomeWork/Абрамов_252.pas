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
   writeln('���-�� ������������� ������� "+" � ������������������: ', sum1);
   writeln('���-�� ������������� ������� "*" � ������������������: ', sum2);
   writeln('���-�� ������������� ������� "-" � ������������������: ', sum3);
   writeln('����� ���-�� ������������� ������� "+", "-" � "*" � ������������������: ', sum1+sum2+sum3);
end.