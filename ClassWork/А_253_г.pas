uses crt;
const
    // s = '.wre...w.fd.....ccd......';
    // s = '.. hg......ty......';
     s = '..........';
var
   i: byte;
function c_point(i:byte):byte;
var j: byte;
begin
     j := i+1;
     while (s[j] = '.') and (j<=length(s)) do
           inc(j);
     c_point := j-i;
end;
begin
     i := 1;
     while (i<length(s)) do
     begin
          if s[i] = '.' then
          begin
             l := c_point(i)
             if  then
                writeln(c_point(i));
          end;
          inc(i);
     end;
end.