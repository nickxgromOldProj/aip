object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 231
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GoneLabel: TLabel
    Left = 326
    Top = 8
    Width = 58
    Height = 13
    Caption = #1042#1099#1073#1099#1074#1096#1080#1077':'
  end
  object OrLabel: TLabel
    Left = 216
    Top = 103
    Width = 18
    Height = 13
    Caption = #1080#1083#1080
  end
  object WordCountLabel: TLabel
    Left = 135
    Top = 120
    Width = 65
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1089#1083#1086#1074':'
  end
  object PlayersList: TListBox
    Left = 8
    Top = 8
    Width = 121
    Height = 185
    ItemHeight = 13
    TabOrder = 0
  end
  object LoadButton: TButton
    Left = 8
    Top = 199
    Width = 121
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1075#1088#1086#1082#1086#1074
    TabOrder = 1
    OnClick = LoadButtonClick
  end
  object CounterMemo: TMemo
    Left = 135
    Top = 8
    Width = 185
    Height = 89
    Enabled = False
    Lines.Strings = (
      #1056#1072#1079', '#1076#1074#1072', '#1090#1088#1080', '#1095#1077#1090#1099#1088#1077', '#1087#1103#1090#1100','
      #1042#1099#1096#1077#1083' '#1090#1080#1075#1088' '#1087#1086#1075#1091#1083#1103#1090#1100'.'
      #1047#1072#1087#1077#1088#1077#1090#1100' '#1077#1075#1086' '#1079#1072#1073#1099#1083#1080'.'
      #1056#1072#1079', '#1076#1074#1072', '#1090#1088#1080', '#1095#1077#1090#1099#1088#1077'.')
    TabOrder = 2
  end
  object StartCounterButton: TButton
    Left = 135
    Top = 167
    Width = 185
    Height = 25
    Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1089#1095#1080#1090#1072#1083#1086#1095#1082#1091
    TabOrder = 3
    OnClick = StartCounterButtonClick
  end
  object GoneList: TListBox
    Left = 326
    Top = 27
    Width = 121
    Height = 196
    ItemHeight = 13
    TabOrder = 4
  end
  object ResetButton: TButton
    Left = 160
    Top = 198
    Width = 129
    Height = 25
    Caption = #1055#1077#1088#1077#1079#1072#1087#1091#1089#1090#1080#1090#1100
    TabOrder = 5
    OnClick = ResetButtonClick
  end
  object WordCountEdit: TEdit
    Left = 135
    Top = 139
    Width = 185
    Height = 21
    TabOrder = 6
  end
  object OpenPlayersDialog: TOpenDialog
    Left = 392
    Top = 72
  end
end
