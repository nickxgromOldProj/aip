unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure coord();
    procedure draw();
  end;

var
  Form1: TForm1;
  h, point: byte;
  xc, yc, i, px, py: integer;
  x, y : real;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  h := StrToInt(Edit1.Text);
  point := Image1.Width div h;
  yc := Image1.Height div 2;
  xc := Image1.Width div 2;

  coord;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  draw;
end;

procedure TForm1.coord;
begin

  with Image1.Canvas do
  begin
    Rectangle(0, 0, Image1.Width, Image1.Height);
    Pen.Color := clBlack;
    Pen.Width := 1;
    MoveTo(0, 320);
    LineTo(640,320);
    MoveTo(320, 0);
    LineTo(320, 640);
  end;

  px := xc mod h;
  py := 320;
  i := (Image1.Width div h) div 2 * (-1);
  while px<640 do  //???????????? ?
  begin
    With Image1.Canvas do
    begin
      MoveTo(px, py);
      LineTo(px, py+10);
      if i<>0 then
        TextOut(px-5, py+20, IntToStr(i));
    end;
    inc(i);
    px := px+h;
  end;

  px := 310;
  py := yc mod h;
  i := (Image1.Height div h) div 2;
  while py<640 do  //???????????? ?
  begin
    With Image1.Canvas do
    begin
      MoveTo(px, py);
      LineTo(px+10, py);
      if i<>0 then
        TextOut(px-20, py-5, IntToStr(i));
    end;
    dec(i);
    py := py+h;
  end;
end;

procedure TForm1.draw;
begin
  x := 0;
  with Form1.Image1.Canvas do
  begin
  while x<Image1.Width do
  begin
    y := sin(x)*sin(x)-cos(x)*cos(x);
    px := round(x*h);
    py := round(y*h)+yc;
    Pixels[px+5, py] := clRed;
    x := x+0.01;
  end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  h := 20;
  xc := Image1.Width div 2;
  yc := Image1.Height div 2;
  coord;
end;

end.
