object Form1: TForm1
  Left = 192
  Top = 164
  Width = 870
  Height = 337
  Caption = #1047#1083#1072#1090#1086#1087#1086#1083#1100#1089#1082#1080#1081' 8.15'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 524
    Top = 273
    Width = 324
    Height = 24
    Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1083' '#1080' '#1089#1076#1072#1083' '#1043#1088#1086#1084#1099#1082#1086' '#1053#1080#1082#1080#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 1
    Top = -1
    Width = 850
    Height = 229
    ColCount = 7
    DefaultColWidth = 120
    RowCount = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
  end
  object Button1: TButton
    Left = 1
    Top = 226
    Width = 244
    Height = 73
    Caption = #1057#1075#1077#1085#1080#1088#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
