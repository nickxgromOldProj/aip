object Form1: TForm1
  Left = 248
  Top = 249
  Width = 564
  Height = 563
  Caption = 'Form1'
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
  object shp1: TShape
    Left = 10
    Top = 10
    Width = 200
    Height = 383
    Shape = stRoundRect
  end
  object shp2: TShape
    Left = 75
    Top = 64
    Width = 70
    Height = 70
    Shape = stCircle
  end
  object shp3: TShape
    Left = 75
    Top = 176
    Width = 70
    Height = 70
    Shape = stCircle
  end
  object shp4: TShape
    Left = 75
    Top = 288
    Width = 70
    Height = 70
    Shape = stCircle
  end
  object shp5: TShape
    Left = 285
    Top = 283
    Width = 150
    Height = 150
  end
  object lbl1: TLabel
    Left = 360
    Top = 300
    Width = 42
    Height = 116
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -96
    Font.Name = 'Agency FB'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 320
    Top = 300
    Width = 42
    Height = 116
    Caption = '8'
    Font.Charset = ANSI_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -96
    Font.Name = 'Agency FB'
    Font.Style = []
    ParentFont = False
  end
  object btn1: TButton
    Left = 320
    Top = 120
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 16
    Top = 408
  end
end
