uses crt;
var
   s1, s2, s: string;
   n1, n2: byte;
begin
     write('������� 1� ������: ');
     read(s1);
     write('������� 2� ������: ');
     read(s2);
     write('������� �������� ����� �� 1� ������: ');
     read(n1);
     write('������� �������� ����� �� 2� ������: ');
     read(n2);

     s := copy(s1, 1, n1);
     s := s + copy(s2, length(s2)-n2+1, n2);
     writeln('��������������� ������: ', s)
end.