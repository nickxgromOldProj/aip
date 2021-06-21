unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

const
  n = 8;

type
  athletes = record
    sport: array[1..5] of 1..100;
  end;
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  winner: byte;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i:byte;
begin
  winner := 255;
  with StringGrid1 do
  begin
    Cells[0, 0] := 'Спортсмен';
    Cells[1, 0] := 'Конкур';
    Cells[2, 0] := 'Фехтование';
    Cells[3, 0] := 'Стрельба';
    Cells[4, 0] := 'Плавание';
    Cells[5, 0] := 'Кросс';
    Cells[6, 0] := 'Сумма';

    for i := 1 to 8 do
      Cells[0, i] := IntToStr(i);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ath: athletes;
  t: file of byte;
  i, j: byte;
  sum, sum1: word;
begin
  Randomize;
  assignFile(t, 'data/ath_typed.txt');
  reset(t);
  sum1 := 0;
  for i := 1 to n do
  begin
    sum := 0;
    for j := 1 to 5 do
    begin
      ath.sport[j] := random(100)+1;
      StringGrid1.Cells[j, i] := IntToStr(ath.sport[j]);
      write(t, ath.sport[j]);
      sum := sum + ath.sport[j];
    end;
    StringGrid1.Cells[6, i] := IntToStr(sum);
    if sum>sum1 then
    begin
      winner := i;
      sum1 := sum;
    end;
  end;
  CloseFile(t);
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin

  if (ACol>0) and (ACol<255) and (ARow=winner) then
  begin
       StringGrid1.Canvas.Brush.Color := clLime;
       StringGrid1.Canvas.FillRect(Rect);
       StringGrid1.Canvas.Font.Color := clBlack;
       StringGrid1.Canvas.TextOut(Rect.Left, Rect.Top, StringGrid1.Cells[ACol, ARow]);

  end;
end;

end.
