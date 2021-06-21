uses crt;
var
   s1, s2, s: string;
   n1, n2: byte;
begin
     write('Введите 1ю строку: ');
     read(s1);
     write('Введите 2ю строку: ');
     read(s2);
     write('Сколько символов взять из 1й строки: ');
     read(n1);
     write('Сколько символов взять из 2й строки: ');
     read(n2);

     s := copy(s1, 1, n1);
     s := s + copy(s2, length(s2)-n2+1, n2);
     writeln('Преобразованная строка: ', s)
end.