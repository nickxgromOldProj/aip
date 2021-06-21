uses crt;
const
    n=10;
var
    f: text;
    t: file of real;
    a, a1, a2, a3, b:real;
    i, id: byte;
begin
    assign(f, 'input.pas');
    reset(f);
    assign(t, 'output.pas');
    rewrite(t);
    
    while not eof(f) do
    begin
        read(f, a);
        write(t, a);
    end;
    
    reset(t);
    for i := 1 to filesize(t)-2 do
    begin
        seek(t, i-1);
        read(t, a1);
        seek(t, i);
        read(t, a2);
        seek(t, i+1);
        read(t, a2);
        if (a2>a1) and (a2>a3) then
        begin
        
        end;
    end;
    
    close(f);
    close(t);
end.