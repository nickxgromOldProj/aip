//uses crt;
var
   t, t1, max: string;
   i, j: byte;
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
procedure print(k:byte);
var i:byte;
begin
    for i := 1 to k do
        writeln(i, ') ',m[i]);
end;
procedure sort(i: byte);
var
    k, j: byte;
begin
       for k := 1 to i-1 do
        for j := 1 to i-1 do
            if m[j][1] < m[j+1][1] then
            begin
                t1 := m[j];
                m[j] := m[j+1];
                m[j+1] := t1;
            end;
        writeln;
end;
begin   
   t := 'lorem     ipsum  dolor   sit  amet       consectetur    adipiscing elit sed do.';
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
   //1
   writeln('Текст: ', t);
   i := 0;
   while length(t)>0 do
   begin
      inc(i);
      m[i] := copy(t, 1, pos(' ', t)-1);
      delete(t, 1, pos(' ', t));
   end;
   writeln('Массив слов: ');
   print(i);
   //2
   sort(i);
   print(i);
   
   max := m[1];
   for j := 2 to i do
   begin
        if length(max)<length(m[j]) then
            max := m[j];
   end;
   
end.