unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  arr: array[1..100] of integer;
  n: byte;
  num, a, b, c, d, e, f: set of byte;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  f: textFile;
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute then
  begin
    num := [];
    AssignFile(f, OpenDialog1.FileName);
    Reset(f);
    Label1.Caption := '��������: ' + #13#10;
    n := 0;
    while not eof(f) do
    begin
      inc(n);
      read(f, arr[n]);
      num := num + [arr[n]];
    end;
    Button2.Enabled := true;
    CloseFile(f);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i, j,b_k, c_k, d_k: Integer;
  yes: boolean;
begin
  a := [];
  b := [];
  c := [];
  d := [];
  e := [];
  f := [];
  c_k := 0;
  b_k := 0;
  for i := 1 to n do
  begin
//  �
    if not(arr[i] in a) then
      a := a + [arr[i]]
    else
      a := a - [arr[i]];
//  �
  for j := 1 to n do
  begin
    if i<>j then
      if arr[i] = arr[j] then
        b := b + [arr[i]];
    if arr[i]<>arr[j] then
      c := c + [arr[i]];
  end;
  end;
//  �
  d := num - b;
  for i := 1 to n do
  begin
    if arr[i] in d then
      inc(d_k);
      for j := 1 to n do
        if (arr[i] in b) and (arr[i]<>arr[j]) and (i<>j) then
      inc(b_k);
      if (arr[i] in a)then
        Label1.Caption := Label1.Caption + IntToStr(arr[i]) + ' ';
      if (arr[i] in b) and (arr[i]<>arr[j]) then
        Label2.Caption := Label2.Caption + IntToStr(arr[i]);
  end;

end;

procedure TForm1.N1Click(Sender: TObject);
begin
   Memo1.Text := '���� ������� s[1], ..., s[n]. ���� ������������������ �������� �����������, �� �������� �� ��� ���������, ����� �������� ������������������ s[1], s[2], ..., s[n-1], s[n], s[s-1], ..., s[2], s[1]';
  Memo1.Visible := true;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Memo1.Visible := false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Memo1.Visible := true;
  Memo1.Text := '������ ���������� ������� ������, ����������� ������ 207-�, �� ���������� �����'
end;

end.
