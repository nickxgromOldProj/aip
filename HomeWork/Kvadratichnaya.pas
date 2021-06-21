const
  order = 3;
type 
  vector = array [1..20] of real;
  matrix = array [1..20 , 1..20] of real;
  free_member_vector = array [1..20] of real;
var
  xv , yv , unit_vector , x : vector;
  i , j , n : integer;
  m : matrix;
  v : free_member_vector;
  sum : real;

{Функция суммы конкретного коэффициента по формуле} 
function fsum (x , y : vector ; power : integer) : real;
  var
    i , j : integer;
    sum , p : real;
  begin
    
    for i := 1 to n do begin
      p := 1;
      for j := 1 to power do  
        p := p * x[i]; 
      sum := sum + p * y[i]; 
    end;
    fsum := sum;
  end;
  
{Считывание таблицы значений x,y} 
procedure read_table; 
  var
    i : integer;
    t : text;
  begin
    assign (t , 'input.txt');
    reset (t);
    read (t,n);            {первое число в тескстовом файле - колл-во узловых точек}  
    for i := 1 to n do begin
      read (t,xv[i]);
      read (t,yv[i]);
      unit_vector[i] := 1;
    end;
    close (t); 
  end;

procedure make_matrix;  {Применение формулы квадратичной аппроксимации}
  var
    i , j , k : integer;
  begin
    k := 4;
    for i := 1 to order do begin
      for j := 1 to order do begin
        m[i,j] := fsum (xv , unit_vector , k);
        dec (k);
        if (i = 3) and (j = 3) then
          m[i,j] := n;
      end;
      inc(k);
      v[i] := fsum(xv , yv , k);
      inc(k);
    end;
  end;
procedure Gausse(); {нахождение корней полученной матрицы методом Гаусса}
  var
  i , k , j :integer;
  r , g : real;
begin
  for k := 1 to order do begin  { прямой ход Гаусса }
    for j := k + 1 to order do begin
      r := m[j, k] / m[k, k];
      for i := k to order do
        m[j, i] := m[j, i] - r * m[k, i];
      v[j] := v[j] - r * v[k];
    end;
  end;
  for k := order downto 1 do { обратный ход Гаусса }
  begin
    r := 0;
    for j := k + 1 to order do begin
      g := m[k, j] * x[j];
      r := r + g;
    end;
    x[k] := (v[k] - r) / m[k, k];
  end;

end;


begin
  read_table;
  make_matrix;
  
  for i := 1 to order do begin
    for j := 1 to order do
      write (m[i,j]:10:1);
    write ('    |',v[i]:8:1);
    writeln;
  end;
  
  Gausse;
  
  writeln('Корни уравнения: ');
  for i := 1 to order do
    writeln('x',i,': ', x[i]:6:3);
end.