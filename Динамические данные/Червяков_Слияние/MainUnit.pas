unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    FirstListBox: TListBox;
    SecondListBox: TListBox;
    MergedListBox: TListBox;
    LoadFirstButton: TButton;
    LoadSecondButton: TButton;
    MergeButton: TButton;
    OpenListDialog: TOpenDialog;
    procedure LoadFirstButtonClick(Sender: TObject);
    procedure LoadSecondButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MergeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  LinearListLinkRef = ^LinearListLink;
  LinearListLink = record
    data: integer;
    next: LinearListLinkRef;
  end;
  LinearList = record
    head: LinearListLinkRef;
  end;

var
  MainForm: TMainForm;
  list1, list2, merged_list: LinearList;

implementation

{$R *.dfm}

procedure LoadListFromFile(filename: string; var list: LinearList);
var
  t: TextFile;
  current_node: LinearListLinkRef;
  i: integer;
begin
  assign(t, filename);
  reset(t);

  new(list.head);
  current_node := list.head;
  readln(t, list.head^.data);
  while not eof(t) do begin
    new(current_node^.next);
    current_node := current_node^.next;
    readln(t, current_node^.data);
  end;

  current_node^.next := nil;

  closefile(t);
end;


procedure Push(var link: LinearListLinkRef; var list: LinearList);
var
  current_link: LinearListLinkRef;
  link_copy: LinearListLinkRef;
begin
  new(link_copy);
  link_copy^.data := link^.data;
  link_copy^.next := nil;
  if list.head = nil then begin
    list.head := link_copy;
    exit;
  end;
  current_link := list.head;
  while current_link^.next <> nil do begin
    current_link := current_link^.next;
  end;
  current_link^.next := link_copy;
end;

procedure PopStart(var list: LinearList);
var
  mem: LinearListLinkRef;
begin
  mem := list.head;
  list.head := list.head^.next;
  dispose(mem);
end;

function isEmpty(var list: LinearList): boolean;
begin
  isEmpty := list.head = nil;
end;

function MergeSortLists(var list1: LinearList; var list2: LinearList): LinearList;
var
  sorted_list: LinearList;
begin
  while (not isEmpty(list1)) and (not isEmpty(list2)) do begin
    if list1.head^.data <= list2.head^.data then begin
      Push(list1.head, sorted_list);
      PopStart(list1);
    end else begin
      Push(list2.head, sorted_list);
      PopStart(list2);
    end;
  end;

  while not isEmpty(list1) do begin
    Push(list1.head, sorted_list);
    PopStart(list1);
  end;
  while not isEmpty(list2) do begin
    Push(list2.head, sorted_list);
    PopStart(list2);
  end;

  MergeSortLists := sorted_list;
end;

procedure PrintList(var list: LinearList; ListBox: TListBox);
var
  current_link: LinearListLinkRef;
begin
  ListBox.Clear;
  current_link := list.head;
  while current_link <> nil do begin
    ListBox.Items.Add(IntToStr(current_link^.data));
    current_link := current_link^.next;
  end;
end;

//procedure SortList(var list: LinearList);
//var
//  current_link, prev_link, mem: LinearListLinkRef;
//begin
//  current_link := list.head^.next;
//  prev_link := list.head;
//  while current_link^.next <> nil do begin
//    while (prev_link <> list.head) and (prev_link^.data > current_link^.data) do begin
//      mem := prev_link;
//    end;
//  end;
//end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  OpenListDialog.InitialDir := GetCurrentDir;
end;

procedure TMainForm.LoadFirstButtonClick(Sender: TObject);
begin
  if OpenListDialog.Execute then begin
    LoadListFromFile(OpenListDialog.FileName, list1);
    LoadFirstButton.Enabled := false;
    PrintList(list1, FirstListBox);
  end;
end;

procedure TMainForm.LoadSecondButtonClick(Sender: TObject);
begin
  if OpenListDialog.Execute then begin
    LoadListFromFile(OpenListDialog.FileName, list2);
    LoadSecondButton.Enabled := false;
    PrintList(list2, SecondListBox);
  end;
end;

procedure TMainForm.MergeButtonClick(Sender: TObject);
begin
  merged_list := MergeSortLists(list1, list2);
  MergeButton.Enabled := false;
  PrintList(merged_list, MergedListBox);
end;

end.
