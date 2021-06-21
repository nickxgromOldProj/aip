uses crt;
var
   s, s1, s2: string;
   id: byte;
begin
     write('¬ведите преобразуемую строку: ');
     read(s);
     write('¬ведите замен€емую строку: ');
     read(s1);
     write('¬ведите замен€ющую строку: ');
     read(s2);
     
     id := pos(s1, s);
     delete(s, id, length(s1));
     insert(s2, s, 1);
     write('ѕреобразованна€ строка: ',s);
end.