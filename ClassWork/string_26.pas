uses crt;
var
   s: string;
   n: byte;
begin
     write('¬ведите строку: ');
     read(s);
     write('¬ведите длину обтравочной маски: ');
     read(n);
     if length(s)>n then
        delete(s, 1, length(s)-n);

     if  length(s)<n then
         while length(s)<n do
         insert('.', s, 1);
     clrscr;
     writeln('12345678901234567890');
     write(s);
end.