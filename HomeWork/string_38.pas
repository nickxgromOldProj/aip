//uses crt;
var
   s, s1, s2: string;
   id, i: byte;
begin
     write('������� ������������� ������: ');
     readln(s);
     write('������� ���������� ������: ');
     readln(s1);
     write('������� ���������� ������: ');
     readln(s2);
//     s := '�������������';
//     s1 := '�';
//     s2 := '�';
     
     
     if pos(s1, s)>0 then
     begin
      while pos(s1, s)>0 do
        begin
           inc(i);
           id := pos(s1, s);
           delete(s, id, length(s1));
           insert(s2, s, id);
        end;
        writeln('��������������� ������: ', s);
     end
     else
       writeln('� ��������� ���������� ������ �� ������� � �������������');
end.