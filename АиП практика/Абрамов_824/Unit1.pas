unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers, Vcl.Menus;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Memo1: TMemo;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  tMonth = (jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);

var
  Form1: TForm1;
  day: 1..31;
  month: tMonth;
  year: word;
  maxDay: 28..31;
  can_do: boolean;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  can_do := true;

  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
  begin
    day := StrToInt(Edit1.Text);
    year := StrToInt(Edit3.Text);

    case StrToInt(Edit2.Text) of
      1: month := jan;
      2: month := feb;
      3: month := mar;
      4: month := apr;
      5: month := may;
      6: month := jun;
      7: month := jul;
      8: month := aug;
      9: month := sep;
      10: month := oct;
      11: month := nov;
      12: month := dec;
    end;

    case month of
      jan, mar, may, jul, aug, oct, dec: maxDay := 31;
      apr, jun, sep, nov: maxDay := 30;
      feb: if (year mod 4 = 0) or (year mod 100 = 0) and (year mod 400 <>0) then
          maxDay := 29
         else
          maxDay := 28;
    end;
    can_do := (day>0) and (day<32) and (ord(month)>-1) and
              (ord(month)<12) and (year>0) and (day <= maxDay);
    if can_do then
    begin
      if day+1 > maxDay then
        if ord(succ(month)) > 11 then
        begin
          year := year+1;
          month := jan;
          day := 1;
        end
        else
        begin
          day := 1;
          month := succ(month);
        end
      else
        day := day+1;
      Label1.Caption := 'Завтра будет ' + IntToStr(day) + '.' + IntToStr(ord(month)+1) + '.' + IntToStr(year);
    end
    else
      MessageBox(0, 'Дата введена некорректно', 'Ошибка', mb_iconerror);
  end
  else
    MessageBox(0, 'Введите данные в поля', 'Ошибка', mb_iconerror);


end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Label1.Visible := false;
  Memo1.Height := 190;
  Memo1.Text := 'Даны натуральные числа a, b, c, которые обозначают число месяц и год. Получить тройку чисел следующего дня';
  Memo1.Visible := true;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Memo1.Visible := false;
  Label1.Visible := true;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Label1.Visible := false;
  Memo1.Height := 130;
  Memo1.Text := 'Задачу выполнил Громыко Никита, обучающийся группы 207-П на факультете ВТиПО';
  Memo1.Visible := true;
end;

end.
