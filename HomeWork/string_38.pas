//uses crt;
var
   s, s1, s2: string;
   id, i: byte;
begin
     write('¬ведите преобразуемую строку: ');
     readln(s);
     write('¬ведите замен€емую строку: ');
     readln(s1);
     write('¬ведите замен€ющую строку: ');
     readln(s2);
//     s := 'благодарнасть';
//     s1 := 'а';
//     s2 := 'о';
     
     
     if pos(s1, s)>0 then
     begin
      while pos(s1, s)>0 do
        begin
           inc(i);
           id := pos(s1, s);
           delete(s, id, length(s1));
           insert(s2, s, id);
        end;
        writeln('ѕреобразованна€ строка: ', s);
     end
     else
       writeln('  сожалению замен€ющей строки не найдено в преобразуемой');
end.