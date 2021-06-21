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
    Button1: TButton;
    ListBox1: TListBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  i, j: Integer;
  max, min: real;
begin
  if (StrToInt(Edit1.Text)>2) and (StrToInt(Edit1.Text)>2) and (Edit1.Text <> '') and (Edit1.Text <> '') then
  begin
    ListBox1.Clear;
    StringGrid1.RowCount := StrToInt(Edit1.Text);
    StringGrid1.ColCount := StrToInt(Edit2.Text);
    randomize;
    for i := 0 to StringGrid1.RowCount-1 do
      for j := 0 to StringGrid1.ColCount-1 do
        StringGrid1.Cells[j, i] := FormatFloat('0.#', (random(100)/(random(10)+1)));

    for i := 0 to StringGrid1.RowCount-1 do
    begin
      max := StrToFloat(StringGrid1.Cells[1, i]);
      min := StrToFloat(StringGrid1.Cells[1, i]);
      for j := 0 to StringGrid1.ColCount-1 do
      begin
        if StrToFloat(StringGrid1.Cells[j, i]) > max then
          max := StrToFloat(StringGrid1.Cells[j, i]);
        if StrToFloat(StringGrid1.Cells[j, i]) < min then
          min := StrToFloat(StringGrid1.Cells[j, i]);
      end;
      ListBox1.Items.Add(FloatToStr(min));
    end;
  end
  else
    MessageBox(0, '', '', mb_iconError);

end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Memo1.Visible := true;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Memo1.Visible := false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Memo1.Visible := true;
  Memo1.Text := 'Задачу подготовил Громыко Никита, обучающийся группы 207-П, на факультете ВТиПО'
end;

end.
