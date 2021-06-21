uses crt;
const n = 7;
var
   x, y: array[1..n] of real;
   arg, pL: real;
   i: byte;
procedure input;
var
   f: text;
begin
   assign(f, 'L_input.txt');
   reset(f);
   
   for i:byte := 1 to n do
   begin
      read(f, x[i]);
      read(f, y[i]);
   end;
   close(f);
end;
function PmL(arg:real; i:byte):real;
var
   num, denom: real;
   j: byte;
begin
      num := 1; //числитель
      denom := 1;//знаменатель
      for j := 1 to n do
      begin
         if i<>j then 
         begin
            num := num*(arg-x[j]);
            denom := denom*(x[i]-x[j]);
         end; 
         PmL := num/denom;
      end;  
end;
begin
   input;
   write('Введите аргумент для логарифма по основанию 2: ');
   read(arg); //x аргумент для логарифма по основанию 2
   
   for i := 1 to n do
      pL := pL + y[i] * PmL(arg, i);
   writeln('Логарифм по основанию 2 от ', arg, ' = ', pL:6:3);
   writeln('Встроенная функция логарифма = ', ln(arg)/ln(2):6:3);
   writeln('Авсолютная погрешность = ', abs(pL - ln(arg)/ln(2)):6:3);
   writeln;
end.