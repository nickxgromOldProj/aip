//Задачи:
// a) Оставить между словами по одному пробелу
// b) Перед первым символом удалить пробел
// c) После последнего символа вставить пробел
// d) Преобразовать текст в массив слов
uses crt;
var
   t: string;
   i: byte;
   m: array[1..122] of string;
function d(s: char; k: byte):byte;
var i:byte;
begin
   while (k<=length(t)) and (t[k] = s) do
   begin
      inc(i);
      inc(k);
   end;
   d := i;
end;
begin   
//                1         2         3         4         5         6         7         8
//       12345678901234567890123456789012345678901234567890123456789012345678901234567890
   t := ' Иметь   миллион  и   не    иметь     миллиона    это     вместе    два   миллиона';
//   write('Введите текст: ');
//   read(t);
   clrscr;
   writeln('Текст: ', t);
//    b
   if t[1] = ' ' then
      delete(t, 1, 1);
//    c
   t := t + ' ';
//    a, d
   while i<=length(t) do
   begin
      inc(i);
      if d(' ', i) > 1 then
         delete(t, i, d(' ', i+1));
      
   end;
   i := 1;
   while length(t)>0 do
   begin
      m[i] := copy(t, 1, pos(' ', t)-1);
      delete(t, 1, pos(' ', t));
      writeln(i, ') ',m[i]);
      inc(i);
   end;
end.