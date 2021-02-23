object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Criar Banco de Dados '
  ClientHeight = 209
  ClientWidth = 513
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 209
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 15
      Top = 8
      Width = 162
      Height = 73
      Caption = 'Criar Bancos'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object conexao: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    Left = 248
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 248
    Top = 80
  end
  object Qry: TFDQuery
    Connection = conexao
    Left = 248
    Top = 136
  end
end
