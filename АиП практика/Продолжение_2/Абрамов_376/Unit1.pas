unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    StringGrid1: TStringGrid;
    ListBox1: TListBox;
    GroupBox1: TGroupBox;
    Button2: TButton;
    GroupBox2: TGroupBox;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    Button1: TButton;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure main;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  b: array[1..9] of integer;


implementation

{$R *.dfm}

procedure TForm1.main;
var
  i, j, k: Integer;
begin
  ListBox1.Clear;
  k := 0;
  for i := 1 to StringGrid1.RowCount do
  begin
    if b[i]>0 then
      for j := 1 to StringGrid1.ColCount do
        if StrToFloat(StringGrid1.Cells[j-1, i-1])>0 then
          StringGrid1.Cells[j-1, i-1] := '1'
        else if StrToFloat(StringGrid1.Cells[j-1, i-1])<>0 then
        begin
          StringGrid1.Cells[j-1, i-1] := '-1';
          inc(k);
        end;
  end;
  ListBox1.Items.Add('k = ' + IntToStr(k));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  main;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  f: TextFile;
  i, j: Integer;
  a: real;
begin
  ListBox1.Clear;
  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));
  if OpenDialog1.Execute then
  begin
    for i := 0 to StringGrid1.RowCount-1 do
    StringGrid1.Rows[i].Clear;
    AssignFile(f, OpenDialog1.FileName);
    Reset(f);
    i := 0;
    j := 0;
    while not eoln(f) do
    begin
      inc(i);
      read(f, b[i]);
      Label3.Caption := Label3.Caption + IntToStr(b[i]) + '  ';
    end;
    i := -1;
    while not eof(f) do
    begin
      if eoln(f) then
      begin
        inc(i);
        j := 0;
      end;
       read(f, a);
       StringGrid1.Cells[j, i] := FloatToStr(a);
       inc(j);
    end;

    StringGrid1.RowCount := i+1;
    StringGrid1.ColCount := j;
    CloseFile(f);
    Button1.Enabled := true;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Memo1.Text := '���� ����������� ����� m, ����� ����� a[1], ... a[m] � ������������� ������� ������� m. ������ � ������� i ������� ������� ����������, ���� a[i]>0, � ������������ � ��������� ������.' + #13#10 +
                '�) ����� ��� ��������, ������������� � ���������� ������� ������� ������������� �� �������: ��� ������������� �������� �������� �� -1, ������������� �� 1, � ������� ��������' + #13#10 +
                '�) ���������� ����� ������������� ��������� ������� ������������� � ���������� �������.';
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
