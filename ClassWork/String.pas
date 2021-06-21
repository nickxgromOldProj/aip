uses crt;
const
     n = 10;
     word1 = 'структура';
     word2 = 'программа';
type st = array[1..n] of string;
var
   m:st;
   i:byte;
   pr:string;
begin
    m[1] := copy(word2, 4, 6);
    delete(m[1], 2, 1);
    
    m[2] := copy(word1, 1, 5);
    delete(m[2], 3, 1);
    
    m[3] := copy(word2, 4, 5);
    
    m[4] := copy(word1, 3, 3);
    insert(copy(word1, 9, 1), m[4], 4);
    
    m[5] := copy(word2, 1, 3);
    insert(copy(word1, 5, 1), m[5], 4);
    
    m[6] := m[5];
    insert(word2[pos('о', word2)], m[6], 2);
    delete(m[6], 5, 1);
    m[6] :=  m[6] +  word2[pos('г', word2)];
    
    m[7] := word1[5] + word1[4] + word1[3] + word1[1] + word2[3]+ word2[2];
    
    //m[8] := copy(word2, 2, 2);
    //m[8] := concat(m[8],  copy(word1, 6, 4));
    m[8] := copy(word2, 2, 2) + copy(word1, 6, 1) + copy(word1, 9, 1);
    
    m[9] := copy(word2, 8, 2) + m[2];
    delete(m[9], 5, 1);
    insert(word1[pos('а', word1)], m[9], 5);
    
    m[10] := word1;
    delete(m[10], 2, 2);
    delete(m[10], 3, 1);
    delete(m[10], 4, 2);
    insert(word2[pos('м', word2)], m[10], 2);
    
    
    
    for i:= 1 to 10 do
    begin
         writeln(i, ') ',m[i]);
    end;
end.
