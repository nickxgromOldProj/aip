object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1073#1088#1072#1084#1086#1074' 824'
  ClientHeight = 214
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 153
    Width = 7
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 8
    Width = 122
    Height = 33
    Caption = #1076#1076' /'#1084#1084'/ '#1075#1075
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 24
    Top = 52
    Width = 40
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 63
    Top = 52
    Width = 40
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 102
    Top = 52
    Width = 64
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 4
    NumbersOnly = True
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 24
    Top = 103
    Width = 142
    Height = 35
    Caption = #1047#1072#1074#1090#1088#1072' '#1073#1091#1076#1077#1090'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 8
    Width = 185
    Height = 130
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 200
    Top = 8
    object N1: TMenuItem
      Caption = #1059#1089#1083#1086#1074#1080#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1077#1096#1077#1085#1080#1077
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1054#1073' '#1072#1074#1090#1086#1088#1077
      OnClick = N3Click
    end
  end
end
