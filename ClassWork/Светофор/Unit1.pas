unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    shp4: TShape;
    tmr1: TTimer;
    lbl1: TLabel;
    btn1: TButton;
    shp5: TShape;
    lbl2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure change;
  end;

var
  Form1: TForm1;
  i, k: byte;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  shp1.Brush.Color := rgb(0, 0, 0);
  shp2.Brush.Color := rgb(161, 109, 94);
  shp3.Brush.Color := rgb(179, 162, 77);
  shp4.Brush.Color := rgb(111, 147, 108);
  shp5.Brush.Color := clBlack;
  lbl1.Color := clBlack;
  lbl2.Color := clBlack;
  lbl1.Font.Color := cl3DDkShadow;
  i := 1;
  k := 0;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if i=1 then
  begin
    inc(k);
    change();
  end;
  dec(i);
  lbl1.Caption := IntToStr(i);

end;

procedure TForm1.change;
begin
  case k of
    1: begin
        shp4.Brush.Color := rgb(111, 147, 108);
        Form1.shp2.Brush.Color := RGB(255, 0, 0);
        i := 10;
       end;
    2: begin
        shp2.Brush.Color := rgb(161, 109, 94);
        Form1.shp3.Brush.Color := RGB(255, 211, 0);
        i := 3;
       end;
    3: begin
         shp3.Brush.Color := rgb(179, 162, 77);
         Form1.shp4.Brush.Color := rgb(57, 255, 20);
          i := 10;
          k := 0;
       end;
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  tmr1.Enabled := True;
  lbl1.Font.Color := rgb(255, 187, 0);
end;

end.
