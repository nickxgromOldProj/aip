object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 309
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FirstListBox: TListBox
    Left = 8
    Top = 8
    Width = 121
    Height = 233
    ItemHeight = 13
    TabOrder = 0
  end
  object SecondListBox: TListBox
    Left = 262
    Top = 8
    Width = 121
    Height = 233
    ItemHeight = 13
    TabOrder = 1
  end
  object MergedListBox: TListBox
    Left = 135
    Top = 8
    Width = 121
    Height = 233
    ItemHeight = 13
    TabOrder = 2
  end
  object LoadFirstButton: TButton
    Left = 8
    Top = 247
    Width = 121
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 3
    OnClick = LoadFirstButtonClick
  end
  object LoadSecondButton: TButton
    Left = 262
    Top = 247
    Width = 121
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 4
    OnClick = LoadSecondButtonClick
  end
  object MergeButton: TButton
    Left = 135
    Top = 247
    Width = 121
    Height = 25
    Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100
    TabOrder = 5
    OnClick = MergeButtonClick
  end
  object OpenListDialog: TOpenDialog
    DefaultExt = 'txt'
    Left = 136
    Top = 280
  end
end
