//I формула Ньютона
uses crt;
   const n = 7;
var
   x, x_c, Pn, polyn: real;
   h: byte;
   arg: array[1..n] of real;
   dy: array[1..n, 1..n] of real;
procedure input;
begin
   x_c := x;
   h := 1;
   for i:byte := 1 to n do
   begin
      arg[i] := x;
      dy[1, i] := ln(arg[i])/ln(2);
      x := x + h;
   end;
   
   for i:byte := 2 to n do
      for j:byte := 1 to n-1 do
         if i+j<=8 then
            dy[i, j] := dy[i-1, j+1] - dy[i-1, j];
end;
procedure print;
var
   xd, yd: byte;
begin
   gotoxy(3, 2);
   write('x','y':10, chr(127)+'1y':10, chr(127)+'2y':9, 
   chr(127)+'3y':9, chr(127)+'4y':9, chr(127)+'5y':9, chr(127)+'6y':9);
   
   xd := 3;
   yd := xd;
   for i: byte := 1 to n do
   begin
      gotoxy(xd, yd);
      writeln(arg[i]:0:0);
      inc(yd);
   end;
   
   xd := 10;
   yd := 3;
   
   for i:byte := 1 to n do
   begin
      gotoxy(xd, yd);
      for j:byte := 1 to n do
         write(dy[j, i]:6:3, '   ');
      inc(yd);
   end;
end;
function pnm(pn, fact, h, polyn: real):real;
begin
   for i:byte := 1 to n-1 do
   begin
      fact := fact*i;
      Pn := Pn + (dy[1, i+1]/fact*h)*polyn;
      polyn := polyn * (x_c-arg[i]);
      h := h*2;
   end;
   pnm := Pn;
end;
begin
   write('Введите аргумент для log по основанию 2: ');
   read(x);
   
   input;
   print;
   polyn := x_c-arg[1];
   Pn := dy[1, 1];
   Pn := pnm(dy[1, 1], 1, h, polyn);
   
   writeln;
   writeln('Логарифм = ', Pn:6:3);
   writeln('Встроенная функция логарифма = ', ln(x_c)/ln(2):6:3);
end.