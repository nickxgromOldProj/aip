unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  chain = ^elem;

  elem = record
    val: integer;
    link: chain;
  end;

  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    MainMenu1: TMainMenu;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure insBy;
    procedure insBeg;
    procedure insEnd;
    procedure output;
    procedure byNum(dd: integer);
    procedure byVal;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  p, q: chain;
  n, j, insIndex: integer;
  isLoad: boolean;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var f: textFile;
  i: Integer;
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'res';
  if OpenDialog1.execute then
  begin
    assignFile(f, OpenDialog1.FileName);
    reset(f);
    new(p);
    n := 0;
    q := p;
    while not eof(f) do
    begin
      readln(f, q^.val);
      new(q^.link);
      q := q^.link;
      inc(n);
    end;

    q^.link := nil;

    listBox1.Clear;
    q := p;
    for i := 1 to n do
    begin
      listBox1.Items.Add(IntToStr(i) + ') ' + IntToStr(q^.val));
      q := q^.link
    end;
    q^.link := nil;

    isLoad := true;
    closeFile(f);
  end;
end;

procedure TForm1.output;
var
  i: integer;
begin
  listBox2.Clear;
  q := p;
  for i := 1 to n do
  begin
    listBox2.Items.Add(IntToStr(i) + ') ' + IntToStr(q^.val));
    q := q^.link
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
    insBeg
  else if RadioGroup2.ItemIndex = 1 then
   insEnd
  else
    insBy;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i: Integer;
  b: chain;
begin
  if Edit3.Text<>'' then
    if Radiogroup1.itemIndex = 0 then
      byNum(StrToInt(Edit3.Text))
    else
      byVal;
end;

procedure TForm1.byVal;
var
  delVal, delNum, i: integer;
  b, d: chain;
  hasElem: boolean;
begin
  delVal := StrToInt(Edit3.Text);
  q := p;
  delNum := 0;
  hasElem := false;
  while q^.link<>nil do
  begin
    inc(delNum);
    if q^.val=delVal then
    begin
      hasElem := true;
      if delNum=1 then
      begin
        d := p;
        p := p^.link;
        dispose(d);
        dec(n);
        q := q^.link;
        dec(delNum);
      end
      else
      begin
        b := p;
        for i := 1 to delNum-2 do
          b := b^.link;

        d := b^.link;
        b^.link := b^.link^.link;
        dispose(d);
        dec(n);
        dec(delNum);
        q := b^.link;
      end;
      if delNum=n then
        q^.link := nil;
    end
    else
      q := q^.link;

  end;
  if hasElem then
    output
  else
    ShowMessage('Element with this value is not found');
end;

procedure TForm1.byNum(dd: integer);
var
  delNum: integer;
  i: Integer;
  d: chain;
begin
  delNum := dd;
  if delNum<=n then
  begin
    q := p;
    if delNum=1 then
    begin
      d := p;
      p := p^.link;
      dec(n);
      dec(j);
    end
    else
    begin
      for i := 1 to delNum-2 do
        q := q^.link;

      d := q^.link;
      q^.link := q^.link^.link;
      dispose(d);
      dec(n);
      dec(j);
      if i=n then
        q^.link := nil;
    end;
    output;
  end
  else
    ShowMessage('this element is not already exist');
end;

procedure TForm1.insBeg;
var
  b: chain;
  i: integer;
begin
  q := p;
  new(b);
  new(b^.link);
  b^.val := StrToInt(Edit2.Text);
  b^.link := q;
  p := b;

  inc(n);
  output;
end;

procedure TForm1.insEnd;
var
  i: Integer;
  b: chain;
begin
  q := p;
  for i := 1 to n-1 do
    q := q^.link;

  new(b);
  new(b^.link);
  b^.val := StrToInt(Edit2.Text);
  b^.link := nil;
  q^.link := b;

  inc(n);
  output;
end;

procedure TForm1.insBy;
var
  i: Integer;
  b: chain;
begin
  insIndex := StrToInt(Edit1.Text);
  if (insIndex>n) or (insIndex<1) then
    showMessage('This index is not exist')
  else
  begin
    q := p;
   for i := 1 to insIndex-2 do
    q := q^.link;

    new(b);
    new(b^.link);
    b^.link := q^.link;
    b^.val := StrToInt(Edit2.Text);
    q^.link := b;

    inc(n);
    output;
  end;
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 2 then
    Edit1.Enabled := true
  else
    Edit1.Enabled := false;
end;

end.
