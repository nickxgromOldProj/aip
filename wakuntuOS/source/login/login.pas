unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, acPNG, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.GIFImg;

type
  Tloging = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Timer1: TTimer;
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure load_draw;
  end;

var
  loging: Tloging;
  Image2: TImage;

implementation

{$R *.dfm}

procedure Tloging.Button1Click(Sender: TObject);
begin
  if Button1.Caption = '?????' then
    ShowMessage('Coming Soon')
  else
  begin
    load_draw;
    Button2.Caption := '???????????';
    Button1.Caption := '?????';
    Button1.Top := 330;
  end;
  
end;

procedure Tloging.Button2Click(Sender: TObject);
begin
  if Button2.Caption = '??????? ???????' then
  begin
    ShowMessage('Done');
  end
  else
  begin
    load_draw;
    GifImageDefaultAnimate := true;
    Button2.Caption := '??????? ???????';
    Button1.Caption := '?????';
    Button1.Top := 430;
  end;
end;

procedure Tloging.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  Image2.Visible := true;
  Edit1.Visible := true;
  Edit2.Visible := true;
  Label2.Visible := true;                                       
  Label3.Visible := true;
  Button1.Visible := true; 
  Button2.Visible := true; 
  FreeAndNil(Image2);
  if Button1.Caption = '?????' then
  begin
    Edit3.Visible := true;
    Label4.Visible := true;
  end;
end;

procedure Tloging.load_draw();
begin
  Edit1.Visible := false;
  Edit2.Visible := false;
  Label2.Visible := false;                                       
  Label3.Visible := false;
  Edit3.Visible := false;
  Label4.Visible := false;
  Button1.Visible := false;
  Button2.Visible := false; 
  Image2 := TImage.Create(loging);
  Image2.Parent := loging;
  Image2.Transparent := true;
  Image2.Left := 67;
  Image2.Top := 200;
  Image2.Width := 225;
  Image2.Height := 225;
  GifImageDefaultAnimate := true;
  Image2.Picture.LoadFromFile('loading.gif');
  Timer1.Enabled := true;
end;

end.
