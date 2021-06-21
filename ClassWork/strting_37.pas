uses crt;
var
   s, s1, s2: string;
   id: byte;
function mirror(s:string):string;
var
   i: byte;
begin
     for i := 1 to length(s) do
     begin
          s[i] := s[length(s)-i];
     end;
end;
begin
     //write('¬ведите преобразуемую строку: ');
     //read(s);
     //write('¬ведите замен€емую строку: ');
     //read(s1);
     //write('¬ведите замен€ющую строку: ');
     //read(s2);
     s := 'благодарнасть';
     s1 := 'а';
     s2 := 'о';
     
     s := mirror(s);
     //if pos(s1, s)>0 then
    // begin
    //    s := mirror(s);
    // end
    // else
    //     write('');
     //id := pos(s1, s);
     write(s);
     //write('ѕреобразованна€ строка: ', s);
end.