object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1080' '#1074#1089#1090#1072#1074#1082#1072
  ClientHeight = 476
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 69
    Height = 19
    Caption = #1048#1089#1093#1086#1076#1085#1072#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 471
    Top = 24
    Width = 129
    Height = 19
    Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1085#1072#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 49
    Width = 161
    Height = 384
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 0
  end
  object ListBox2: TListBox
    Left = 471
    Top = 49
    Width = 162
    Height = 415
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 32
    Top = 439
    Width = 89
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 199
    Top = 32
    Width = 243
    Height = 201
    Caption = #1059#1076#1072#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 24
      Width = 185
      Height = 81
      ItemIndex = 0
      Items.Strings = (
        #1055#1086' '#1085#1086#1084#1077#1088#1091
        #1055#1086' '#1079#1085#1072#1095#1077#1085#1080#1102)
      TabOrder = 0
    end
    object Button3: TButton
      Left = 128
      Top = 128
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = Button3Click
    end
    object Edit3: TEdit
      Left = 16
      Top = 127
      Width = 81
      Height = 27
      NumbersOnly = True
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 199
    Top = 239
    Width = 243
    Height = 225
    Caption = #1042#1089#1090#1072#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object RadioGroup2: TRadioGroup
      Left = 16
      Top = 32
      Width = 201
      Height = 105
      ItemIndex = 0
      Items.Strings = (
        #1057' '#1085#1072#1095#1072#1083#1072
        #1057' '#1082#1086#1085#1094#1072
        #1055#1086#1076' '#1085#1086#1084#1077#1088#1086#1084)
      TabOrder = 0
      OnClick = RadioGroup2Click
    end
    object Edit1: TEdit
      Left = 144
      Top = 110
      Width = 65
      Height = 27
      Enabled = False
      NumbersOnly = True
      TabOrder = 1
    end
    object Button2: TButton
      Left = 143
      Top = 168
      Width = 75
      Height = 25
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit2: TEdit
      Left = 71
      Top = 167
      Width = 66
      Height = 27
      TabOrder = 3
    end
  end
  object OpenDialog1: TOpenDialog
  end
  object MainMenu1: TMainMenu
    Left = 32
  end
end
