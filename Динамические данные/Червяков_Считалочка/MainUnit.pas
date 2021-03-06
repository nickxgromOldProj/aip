unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

const
  counter_value = 15;

type
  TMainForm = class(TForm)
    PlayersList: TListBox;
    LoadButton: TButton;
    CounterMemo: TMemo;
    StartCounterButton: TButton;
    GoneList: TListBox;
    GoneLabel: TLabel;
    ResetButton: TButton;
    OpenPlayersDialog: TOpenDialog;
    OrLabel: TLabel;
    WordCountLabel: TLabel;
    WordCountEdit: TEdit;
    procedure LoadButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
    procedure StartCounterButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  LinearListLinkRef = ^LinearListLink;
  LinearListLink = record
    data: string;
    next: LinearListLinkRef;
  end;
  LinearList = record
    head: LinearListLinkRef;
  end;

var
  MainForm: TMainForm;
  player_list: LinearList;
  has_winner: boolean;

implementation

{$R *.dfm}

function LoadPlayersFromFile(filename: string; var player_list: LinearList): boolean;
var
  t: TextFile;
  current_node: LinearListLinkRef;
  i, player_counter: integer;
begin
  assign(t, filename);
  reset(t);

  new(player_list.head);
  current_node := player_list.head;
  readln(t, player_list.head^.data);
  player_counter := 1;
  while not eof(t) do begin
    new(current_node^.next);
    current_node := current_node^.next;
    readln(t, current_node^.data);
    inc(player_counter);
  end;

  if player_counter < 2 then begin
    ShowMessage('??????? ?????? ???? ?? ?????? 2.');
    dispose(player_list.head);
    player_list.head := nil;
    closefile(t);
    LoadPlayersFromFile := false;
    exit;
  end;

  current_node^.next := player_list.head;

  closefile(t);

  LoadPlayersFromFile := true;
end;

procedure PrintList(var list: LinearList);
var
  current_link: LinearListLinkRef;
begin
  MainForm.PlayersList.Clear;
  MainForm.PlayersList.Items.Add(list.head^.data);
  current_link := list.head^.next;
  while current_link <> list.head do begin
    MainForm.PlayersList.Items.Add(current_link^.data);
    current_link := current_link^.next;
  end;
end;

procedure Remove(var list: LinearList; node: LinearListLinkRef);
var
  current_node, previous_node, mem: LinearListLinkRef;
begin
  if node = list.head then begin
    current_node := list.head;
    while current_node^.next <> list.head do
      current_node := current_node^.next;
    current_node^.next := list.head^.next;
    list.head := list.head^.next;
    dispose(node);
    exit;
  end;
  current_node := list.head^.next;
  previous_node := list.head;
  while current_node <> list.head do begin
    if current_node = node then begin
      mem := current_node;
      previous_node^.next := current_node^.next;
      dispose(mem);
      exit;
    end else begin
      previous_node := current_node;
      current_node := current_node^.next;
    end;
  end;
end;

function GetNodeNum(var list: LinearList; node: LinearListLinkRef): integer;
var
  counter: integer;
  current_node: LinearListLinkRef;
begin
  GetNodeNum := 0;

  if node = list.head then begin
    GetNodeNum := 1;
    exit;
  end;

  counter := 2;
  current_node := list.head^.next;
  while current_node <> list.head do begin
    if current_node = node then begin
      GetNodeNum := counter;
      exit;
    end;
    current_node := current_node^.next;
    inc(counter);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  has_winner := false;
  OpenPlayersDialog.InitialDir := GetCurrentDir;
end;

procedure TMainForm.LoadButtonClick(Sender: TObject);
begin
  if OpenPlayersDialog.Execute then begin
    if LoadPlayersFromFile(OpenPlayersDialog.FileName, player_list) then begin
      PrintList(player_list);
      LoadButton.Enabled := false;
    end;
  end;
end;

procedure TMainForm.ResetButtonClick(Sender: TObject);
var
  mem: LinearListLinkRef;
begin
  has_winner := false;
  GoneList.Clear;
  LoadButton.Enabled := true;
  if player_list.head <> nil then begin
    mem := player_list.head;
    player_list.head := nil;
    dispose(mem);
  end;
  PlayersList.Clear;
end;

procedure TMainForm.StartCounterButtonClick(Sender: TObject);
var
  i, user_counter_value, calc_counter_value: integer;
  current_selected_node: LinearListLinkRef;
begin
  if WordCountEdit.Text = '' then
    calc_counter_value := counter_value
  else begin
    try
      user_counter_value := StrToInt(WordCountEdit.Text);

      if user_counter_value <= 0 then begin
        ShowMessage('??????? ???????? ???????? ???? ??????????.');
        exit;      
      end;

      calc_counter_value := user_counter_value;
    except 
      on Exception : EConvertError do begin
        ShowMessage('??????? ???????? ???????? ???? ??????????.');
        exit;
      end;
    end;
  end;

  if has_winner then begin
    ShowMessage('????????????? ??????????.');
  end else if player_list.head = nil then
    ShowMessage('????????? ???????.')
  else begin
    current_selected_node := player_list.head;
    PlayersList.ItemIndex := GetNodeNum(player_list, current_selected_node) - 1;
    sleep(100);

    for i := 1 to calc_counter_value do begin
      current_selected_node := current_selected_node^.next;
      PlayersList.ItemIndex := GetNodeNum(player_list, current_selected_node) - 1;
      sleep(100);
    end;

    GoneList.Items.Add(current_selected_node^.data);
    Remove(player_list, current_selected_node);
    PrintList(player_list);

    if player_list.head^.next = player_list.head then begin
      ShowMessage('??????? ' + player_list.head^.data + '!');
      has_winner := true;
    end;

  end;
end;

end.
