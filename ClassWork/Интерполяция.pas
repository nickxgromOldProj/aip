//I формула Ньютона
uses crt;
var
x, y: real;
function log2(x:real):real;
begin
     log2 := -0.000002*sqr(x)*sqr(x)*sqr(x) -
             0.00006*sqr(x)*sqr(x)*x - 0.007*sqr(x)*sqr(x) +
             0.022*sqr(x)*x - 0.241*sqr(x) + 1.649*x - 1.427;
end;
begin
     write('Введите аргумент для логарифма по основанию 2: ');
     read(x);
     y := log2(x);
     writeln('Полином: ', y:0:3);
     write(ln(2)/ln(x));
end.