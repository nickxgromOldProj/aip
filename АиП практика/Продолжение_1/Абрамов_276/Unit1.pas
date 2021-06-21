unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    ListBox1: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
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
  n: word;
  arr: array of integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  if (Edit1.Text <> '') and (StrToInt(Edit1.Text) > 2) then
  begin
    ListBox1.Clear;
    n := StrToInt(Edit1.Text);
    SetLength(arr, n);
    arr[1] := 1;
    arr[2] := 1;
    ListBox1.Items.Add('1) ' + IntToStr(arr[1]));
    ListBox1.Items.Add('2) ' + IntToStr(arr[2]));
    for i := 3 to n do
    begin
      arr[i] := arr[i div 2] + arr[i-2];
      ListBox1.Items.Add(IntToStr(i) + ') ' + IntToStr(arr[i]));
    end;
  end
  else
    MessageBox(0, '���������� ��������� � ������� ������ ���� ������ ����', '������' , mb_iconError);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Memo1.Text := '��������� ������������������ ����� ����� a[1]..a[n], ��� a[1]=1, a[2]=1, a[i]=a[i/2]+a[i-2] (i=3,..., n)';
  Memo1.Visible := true;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Memo1.Visible := false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Memo1.Text := '������ ���������� ������� ������, ����������� 207-�, �� ���������� �����';
  Memo1.Visible := true;
end;

end.
