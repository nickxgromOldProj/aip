//uses crt;
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

    seek(t, 0);
    read(t, a1);
    read(t, a2);
    read(t, a3);
    id  := 2;
    while not((a2<a1) and (a2<a3)) and not eof(t) do
    begin
        a1 := a2;
        a2 := a3;
        read(t, a3);
        inc(id);
    end;
    

    seek(t, FileSize(t)-1);
    read(t, a1);
    seek(t, FileSize(t)-1);
    write(t, a2);
    seek(t, id-1);
    write(t, a1);
    
    reset(t);
    assign(f, 'Gromyko.pas');
    rewrite(f);
    while not eof(t) do
    begin
        read(t, a1);
        write(f, a1:6:1);
        write (a1:6:1);
    end;
    
    writeln;
    close(f);
    close(t);
end.