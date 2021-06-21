unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    scaleEdit: TEdit;
    decBtn: TButton;
    incBtn: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ComboBox1: TComboBox;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure decBtnClick(Sender: TObject);
    procedure incBtnClick(Sender: TObject);
    procedure drawCoord;
    procedure drawFunc;
    function custom_func(x: real): real;
    procedure drawSqFunc;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  scale: 0..120;
  step: byte;
  x1, x2, func_x, func_y, x, y: real;
  dx, dy: integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  err1, err2: integer;
begin
  if (Edit1.Text<>'') and (Edit2.Text<>'') then
  begin
    val(Edit1.Text, x1, err1);
    val(Edit2.Text, x2, err2);
    if (err1=0) and (err2=0) then
    begin
      x1 := StrToFloat(Edit1.Text);
      x2 := StrToFloat(Edit2.Text);
      drawCoord;
    end
    else
       MessageBox(0, '������������ ������', '������', mb_iconError);
  end
  else
    MessageBox(0, '��� ���� ������ ���� ���������', '������', mb_iconError);

end;

function TForm1.custom_func(x: Real): real;
begin
  case ComboBox1.ItemIndex of
    0: custom_func := sin(x);
    1: custom_func := cos(x);
    2: custom_func := sin(x)*sin(x) - cos(x)*cos(x);
    3: custom_func := sin(x)*sin(x) - cos(x);
    4: custom_func := 2*x*x - 4*x;
  end;
end;

procedure TForm1.drawSqFunc;
var
  eps, acc1, acc2, h, x: real;
  n, i: integer;
begin
  eps := 0.001;
  n := 10;
  repeat
    acc2 := acc1;
    acc1 := 0;
    h := abs(x2-x1)/n;
    x := x1+h/2;
    for i := 1 to n do
    begin
      acc1 := acc1 + custom_func(x);
      x := x+h;
    end;
    acc1 := acc1*h;
    n := n*2
  until abs(acc1-acc2)<=eps;

  Label1.Caption := '�������� ���������: ' + FormatFloat('0.000', acc1);
  Label2.Caption := '���������� ���������: ' + IntToStr(n div 2);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  scale := StrToInt(scaleEdit.Text);
  drawCoord;
end;

procedure TForm1.drawFunc;
begin
  func_x := x1;
  while func_x<=x2 do
  begin
    func_x := func_x+0.001;
    with Image1.Canvas do
      begin
        Pen.Color := clRed;
        MoveTo(250+round(func_x*scale), 250);
        LineTo(250+round(func_x*scale), 250 - round(custom_func(func_x)*scale));
      end;
  end;
  drawSqFunc;
end;

procedure TForm1.drawCoord;
var
  i: Integer;
begin
  with Image1.Canvas do
  begin
    Pen.Color := clBlack;
    Pen.Width := 1;
    Rectangle(0, 0, 500, 500);
    MoveTo(0, 250);
    LineTo(500, 250);
    MoveTo(250, 0);
    LineTo(250, 500);
    step := scale;
    for i := 1 to 250 div scale do
    begin
      MoveTo(250 + i*scale, 250);
      LineTo(250 + i*scale, 260);
      if 250 div scale<12 then
        TextOut(247+i*scale, 270, IntToStr(i))
      else
        if i mod 5 =0 then
          TextOut(247+i*scale, 270, IntToStr(i))
    end;

    for i := 250 div scale downto 1 do
    begin
      MoveTo(250 - i*scale, 250);
      LineTo(250 - i*scale, 260);
      if 250 div scale<12 then
        TextOut(247-i*scale, 270, IntToStr(-i))
      else if i mod 5 =0 then
        TextOut(247-i*scale, 270, IntToStr(-i));
    end;

    for i := 250 div scale downto 1 do
    begin
      MoveTo(250, 250 - i*scale);
      LineTo(260, 250 - i*scale);
      if 250 div scale<12 then
        TextOut(270, 247-i*scale, IntToStr(i))
      else if i mod 5 =0 then
        TextOut(270, 247-i*scale, IntToStr(i))
    end;

    for i :=  1 to 250 div scale do
    begin
      MoveTo(250, 250 + i*scale);
      LineTo(260, 250 + i*scale);
      if 250 div scale<12 then
        TextOut(270, 247+i*scale, IntToStr(-i))
      else if i mod 5 =0 then
        TextOut(270, 247+i*scale, IntToStr(-i))
    end;
  end;
  if ComboBox1.ItemIndex<>-1 then
    drawFunc;
end;

procedure TForm1.incBtnClick(Sender: TObject);
begin
  if StrToInt(scaleEdit.Text) + 10 in [10..120] then
  begin
    scaleEdit.Text := IntToStr(StrToInt(scaleEdit.Text) + 10);
    scale := StrToInt(scaleEdit.Text);
    drawCoord;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Memo1.Text := '���������� ���������� ���������� ������� �� ���������� �����������. ������������ �������� ��' +#13#10+
                '����������� ������ �������, ������ ������ � ������� ������� ��������������. �� ������� �� ������ "���������" ��������� ��������� ������� �� ������� �� �������� ������� � �������� ��������� (�������� ��� ����� � ���� "�������").';
  Memo1.Visible := true;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Memo1.Visible := false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Memo1.Text := '������ ������ ��������� ��������� ������ 207-� ������� �������, ����������� �� ��������� �����.';
  Memo1.Visible := true;
end;

procedure TForm1.decBtnClick(Sender: TObject);
begin
  if StrToInt(scaleEdit.Text) - 10 in [10..120] then
  begin
    scaleEdit.Text := IntToStr(StrToInt(scaleEdit.Text) - 10);
    scale := StrToInt(scaleEdit.Text);
    drawCoord;
  end;
end;

end.
