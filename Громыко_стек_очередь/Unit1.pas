unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  chain = ^elem;
  elem = record
    inf: string;
    link: chain;
  end;

  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    OpenDialog1: TOpenDialog;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure stackIn(var stackHead: chain; element: string);
    procedure stackToList;
    function stackOut(): string;
    procedure stackListPrint;
    procedure createQuene;
    function stackListOut: string;
    procedure queneIn(elem: string);
    procedure quenePrint;
    function queneOut: string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  stack, stackList, queneHead, queneEnd, stackHead: chain;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  f: textFile;
  element: string;
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'res';

  if OpenDialog1.Execute then
  begin
    assignFile(f, OpenDialog1.FileName);
    reset(f);

    stackHead := nil;
    while not eof(f) do
    begin
      readln(f, element);
      stackIn(stackHead, element);
    end;

    stackToList();
    stackListPrint;
    createQuene;
    closeFile(f);

    Edit1.Enabled := true;
    Button2.Enabled := true;
  end;
end;

procedure TForm1.stackIn(var stackHead: chain; element: string);
Begin
    new(stack);
    stack^.inf := element;
    stack^.link := stackHead;
    stackHead := stack;
End;

procedure TForm1.stackToList;
var
  q: chain;
begin
  new(stackList);
  q := stackList;
  while stackHead<>nil do
  begin
    q^.inf := stackOut;
    new(q^.link);
    q := q^.link
  end;
  q^.link := nil;
end;

function TForm1.stackOut: string;
var
  q: chain;
begin
  if stackHead<>nil then
  begin
    result := stackHead^.inf;
    q := stackHead;
    stackHead := stackHead^.link;
    dispose(q);
  end;
end;

procedure TForm1.stackListPrint;
var
  q: chain;
  i: integer;
begin
  listBox1.Clear;
  q := stackList;
  i := 1;
  while q^.link<>nil do
  begin
    listBox1.Items.Add(IntToStr(i) + ') ' + q^.inf);
    inc(i);
    q := q^.link;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  k, i: integer;
  elem: string;
  isEnd: boolean;
begin
  isEnd := false;
  k := StrToInt(Edit1.Text);
  for i := 1 to k do
  begin
    elem := stackListOut;
    if elem='#end' then
      isEnd := true
    else
      queneIn(elem);
  end;
  if isEnd then
  begin
    showMessage('??? ???????? ?? ?????? ?1 ???? ?????????');
    listBox1.Clear;
  end
  else
    stackListPrint;

  quenePrint;
  Edit2.Enabled := true;
  Edit3.Enabled := true;
  Button3.Enabled := true;
  Button4.Enabled := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  fromStackList, fromQuene, i, k: integer;
  elem: string;
  isEnd: boolean;
begin
  fromStackList := StrToInt(Edit2.Text);
  fromQuene := StrToInt(Edit3.Text);
  isEnd := false;
  k := 1;

  for i := 1 to fromStackList do
  begin
    elem := stackListOut;
    if elem='#end' then
      isEnd := true
    else
    begin
      listBox3.Items.Add(IntToStr(k) + ') ' + elem);
      inc(k);
    end;
  end;

  if isEnd then
  begin
    showMessage('??? ???????? ?? ?????? ?1 ???? ?????????');
    listBox1.Clear;
  end
  else
    stackListPrint;

  isEnd := false;
  for i := 1 to fromQuene do
  begin
    elem := queneOut;
    if elem='#end' then
      isEnd := true
    else
    begin
      listBox3.Items.Add(IntToStr(k) + ') ' + elem);
      inc(k);
    end;
  end;

  if isEnd then
  begin
    showMessage('??? ???????? ?? ?????? ?2 ???? ?????????');
    listBox2.Clear;
  end;
    quenePrint;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  listBox1.Clear;
  listBox2.Clear;
  listBox3.Clear;

  Button2.Enabled := false;
  Button3.Enabled := false;
  Button4.Enabled := false;
  Edit1.Enabled := false;
  Edit2.Enabled := false;
  Edit3.Enabled := false;
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
end;

procedure TForm1.createQuene;
begin
  queneHead := nil;
  queneEnd := nil;
end;

function TForm1.stackListOut: string;
var
  q: chain;
begin
  if stackList^.link<>nil then
  begin
    q := stackList;
    stackList := stackList^.link;
    result := q^.inf;
    dispose(q);
  end
  else
    result := '#end';
end;

procedure TForm1.queneIn(elem: string);
var
  q: chain;
begin
  new(q);
  q^.inf := elem;
  q^.link := nil;
  if queneHead=nil then
  begin
    queneHead := q;
    queneEnd := q;
  end
  else
  begin
    queneEnd^.link := q;
    queneEnd := q;
  end;
end;

procedure TForm1.quenePrint;
var
  q: chain;
  i: integer;
begin
  listBox2.Clear;
  q := queneHead;
  i := 1;
  while q<>nil do
  begin
    listBox2.items.Add(IntToStr(i) + ') ' + q^.inf);
    q := q^.link;
    inc(i);
  end;
end;

function TForm1.queneOut: string;
var
  q: chain;
begin
  if queneHead<>nil then
  begin
    q := queneHead;
    queneHead := queneHead^.link;
    result := q^.inf;
    dispose(q);
  end
  else
    result := '#end';
end;

end.
