uses crt;
var
   s, s1, s2: string;
   id: byte;
begin
     write('������� ������������� ������: ');
     read(s);
     write('������� ���������� ������: ');
     read(s1);
     write('������� ���������� ������: ');
     read(s2);
     
     id := pos(s1, s);
     delete(s, id, length(s1));
     insert(s2, s, 1);
     write('��������������� ������: ',s);
end.